import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

import '../../../../../common/common.dart';
import '../../../../../common/utils/ble_communication_manager.dart';
import '../../../../../common/utils/branch.dart';
import '../../../../../common/utils/etc.dart';
import '../../../../../common/utils/my_logger.dart';
import '../../../../domain/usecase/urine/urine_save_usecase.dart';
import '../../../../entity/urine_save_dto.dart';
import '../../../../model/authorization.dart';
import '../../../../model/enum/bluetooth_status.dart';
import '../../../../model/vo_urine.dart';
import '../../../../model/vo_urine_row.dart';

class BluetoothViewModel2 extends ChangeNotifier {
  BluetoothViewModel2() {
    startScan();
  }

  late BluetoothStatus status;

  /// 검사기로부터 받은 데이터 버퍼
  StringBuffer responsebuffer = StringBuffer('');

  ScanResult? scanResult;

  /// 검사기와 연결 상태
  bool _isConnection = false;

  /// scan timeout timer
  Timer? scanTimer;

  /// connect timeout timer
  Timer? connectTimer;

  /// write timeout timer
  Timer? writeTimer;

  /// Bluetooth 연결 상태 Stream
  StreamSubscription? connectSubscription;

  /// Bluetooth 응답 Stream
  StreamSubscription? receivedSubscription;


  /// 블루투스 스캔 시작
  startScan() async {
    _changeState(BluetoothStatus.scan);
    
    var subscription = FlutterBluePlus.onScanResults.listen(
      (results) {
        if (results.isNotEmpty) {
          scanResult = results.last; // the most recently found device
          connectDevice(scanResult!);
        }
      },
    );
    await FlutterBluePlus.startScan(
      withKeywords: BLECommunicationManager.withKeywords,
    );
    _startScanTimer();

    FlutterBluePlus.cancelWhenScanComplete(subscription);
  }

  /// 블루투스 연결
  connectDevice(ScanResult scanResult){
    scanTimer?.cancel();
    _changeState(BluetoothStatus.connect);
    FlutterBluePlus.stopScan();

    _startConnectTimer();
    scanResult.device.connect(autoConnect: false);
    connectionListener(scanResult);
  }

  /// 블루투스 연결 상태(Connected, Disconnected) 리스너
  void connectionListener(ScanResult scanResult) {
    connectSubscription = scanResult.device.connectionState.listen((value){
      switch (value) {
        case BluetoothConnectionState.connected: {
          logger.i('블루투스 연결됨!');
          _isConnection = true;
          setupNotificationAndWrite(scanResult.device);
          break;
        }
        case BluetoothConnectionState.disconnected:{
          logger.i('블루투스 연결끊어짐!');
          _isConnection = false;
          //checkConnectionHistory();
          break;
        }
        default:
          logger.i('블루투스 연결 미상');
          break;
      }
    });
  }


  Future<void> setupNotificationAndWrite(BluetoothDevice device) async {
    // GATT 서비스 및 특성 UUID를 미리 정의
    const String serviceUuid =
        '6e400001-b5a3-f393-e0a9-e50e24dcca9e'; // GATT 서비스 UUID
    const String notificationUuid =
        '6e400003-b5a3-f393-e0a9-e50e24dcca9e'; // Notification 특성 UUID
    const String writeUuid =
        '6e400002-b5a3-f393-e0a9-e50e24dcca9e'; // Write 특성 UUID

    try {
      // 장치의 GATT 서비스 목록 탐색 없이 UUID로 바로 접근
      List<BluetoothService> services = await device.discoverServices();
      BluetoothService? targetService = services.firstWhere(
        (service) => service.uuid.toString() == serviceUuid,
        orElse: () => throw Exception("Service not found"),
      );

      // Notification 특성 설정
      BluetoothCharacteristic? notificationChar =
          targetService.characteristics.firstWhere(
        (characteristic) => characteristic.uuid.toString() == notificationUuid,
        orElse: () => throw Exception("Notification characteristic not found"),
      );

      writeResponseListener(notificationChar);

      // Write 특성 설정
      BluetoothCharacteristic? writeChar =
          targetService.characteristics.firstWhere(
        (characteristic) => characteristic.uuid.toString() == writeUuid,
        orElse: () => throw Exception("Write characteristic not found"),
      );

      final notifyResponse = await notificationChar.setNotifyValue(true);
      logger.i('isNotify: $notifyResponse');

      if (notifyResponse) {
        writeChar.write(
          Etc.hexStringToByteArray(BLECommunicationManager.commandTs),
          withoutResponse: BLECommunicationManager.withoutResponse,
        );
        _startWriteTimer(); // 검사 Time out 시작
      } else {
        //TODO: setNotifyValue false 응답 왔을때 화면 처리 어떻게 해야될까?
        _changeState(BluetoothStatus.unableError);
      }

    } catch (e) {
      _changeState(BluetoothStatus.unableError);
    }
  }



  /// 검사기으로부터 받는 데이터 리스너
  writeResponseListener(BluetoothCharacteristic notificationChar) {
    receivedSubscription = notificationChar.onValueReceived.listen((value) {
      // 버퍼에 수신된 데이터를 쌓는다.
      responsebuffer.write((String.fromCharCodes(value)).replaceAll('\n', ''));
      logger.i(responsebuffer);

      if(responsebuffer.toString().contains('ERR')) {
        _changeState(BluetoothStatus.stripError);
      }

      if(responsebuffer.toString().contains('#G11')){
        logger.i('검사기로부터 수신된 데이터: ${responsebuffer.toString().replaceAll('#T', '\n#T')}');
        List<String> urineRowDataList = Etc.createUrineValuesList(Urine.fromValue(responsebuffer.toString()));

        if(urineRowDataList.isNotEmpty && urineRowDataList.length == 11){

          var urineList = <String>[];
          for(int i = 0 ; i < 11 ; i++){
            urineList.add(Branch.urineGradeResult(inspectionItemTypeList[i], double.parse(urineRowDataList[i])));
          }
          // 결과 데이터 서버에 저장
          saveResultData(urineList);

          allClean();
          //Nav.doPop(context); // 현재 검사 진행 화면 pop
          //Nav.doPush(context, UrineResultView(urineList: urineList, testDate: DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now()).toString()));
        } else {
          logger.e('정상적으로 검사가 완료되지 않았습니다.');
          // Nav.doPop(context); // 현재 검사 진행 화면 pop
          // CustomDialog.showMyDialog(
          //   title: '검사 오류',
          //   content: '정상적으로 검사가 완료되지 않았습니다.\n다시 시도해 주세요.',
          //   mainContext: context,
          // );
        }
      }
    });
  }

  /// 결과데이터 Map 리스트
  List<Map<String, dynamic>> dataMap = <Map<String, dynamic>>[];
  final inspectionItemTypeList = [
    'DT01',
    'DT02',
    'DT03',
    'DT04',
    'DT05',
    'DT06',
    'DT07',
    'DT08',
    'DT09',
    'DT10',
    'DT11',
  ];
  /// 검사 결과 데이터 저장
  saveResultData(List<String> urineList) async {
    for(int i = 0 ; i < 11 ; i++){
      dataMap.add(
          UrineRow(
            Authorization().userID,
            DateFormat('yyyyMMddHHmmss').format(DateTime.now()).toString(),
            inspectionItemTypeList[i],
            urineList[i] != '0' ? '양성' : '음성',
            urineList[i],//Branch.urineGradeResult(inspectionItemTypeList[i], double.parse(urineList[i]))
          ).toMap()
      );
    }

    UrineSaveDTO? response = await UrineSavaUesCase().execute(dataMap);
    if(response?.status.code == '200'){
      logger.i('유린기 검사 데이터 저장 완료!');
    } else {
      logger.i('유린기 검사 데이터 저장 실패:${response?.status.code}');
    }
  }

  /// 블루투스 상태 변경해주는 메서드
  void _changeState(BluetoothStatus status){
    this.status = status;
    notifyListeners();
  }


  /// 모두 초기화
  void allClean() {
    scanResult?.device.disconnect();
    scanResult = null;
    responsebuffer.clear();

    scanTimer?.cancel();
    connectTimer?.cancel();
    writeTimer?.cancel();

    scanTimer = null;
    connectTimer = null;
    writeTimer = null;

    //notificationChar = null;
    //writeChar = null;

    connectSubscription?.cancel();
    receivedSubscription?.cancel();
  }










  /// 검사기를 찾지 못했을 경우 타임아웃
  _startScanTimer() async {
    scanTimer = Timer(10.seconds, () {
        if (scanResult == null) {
          FlutterBluePlus.stopScan();
          status = BluetoothStatus.scanError;
          notifyListeners();
        }
      },
    );
  }

  /// 검사기외 연결하지 못했을 경우 타임아웃
  _startConnectTimer() async {
    connectTimer = Timer(5.seconds, () {
        if (!_isConnection) {
          logger.i('connectTimeOut: 검사기와 연결하지 못함!');
          _changeState(BluetoothStatus.connectError);
        }
      },
    );
  }

  /// 검사기로 write를 했을때 [onValueReceived].[listen]를 통해서
  /// 응답을 받았는지 확인 한다.
  _startWriteTimer() {
    writeTimer = Timer(10.seconds, () {
        if (responsebuffer.isEmpty) {
          _changeState(BluetoothStatus.inspectionError);
        }
      },
    );
  }

}
