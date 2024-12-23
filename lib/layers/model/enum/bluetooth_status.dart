import 'package:flutter/material.dart';

enum BluetoothStatus {
  scan,
  connect,
  inspection,
  scanError,
  connectError,
  inspectionError,
  unableError,
  stripError,
  cutoff;
}


///TODO: 영문으로 변경해야됨
extension BluetoothStatusX on BluetoothStatus {
  String get title =>
      switch(this){
        BluetoothStatus.scan => '검사기 찾는 중',
        BluetoothStatus.connect => '검사기 연결 중',
        BluetoothStatus.inspection => '소변 검사 중',
        BluetoothStatus.scanError => '검사기를 찾지 못했습니다.',
        BluetoothStatus.connectError => '검사기를 연결하지 못했습니다.',
        BluetoothStatus.unableError => '검사기로부터 응답받지 못했습니다.',
        BluetoothStatus.inspectionError => '검사기로부터 응답받지 못했습니다.',
        BluetoothStatus.stripError => '스트립이 비어있습니다.',
        BluetoothStatus.cutoff => '검사기와의 연결이 끊어졌습니다.',
      };

  String get subTitle =>
      switch(this){
        BluetoothStatus.scan => '검사기를 찾는 중입니다.',
        BluetoothStatus.connect => '검사기를 기기와 연결 중입니다.',
        BluetoothStatus.inspection => '소변을 검사 중입니다.',
        BluetoothStatus.scanError => '검사기가 켜져있는지 확인해주세요.',
        BluetoothStatus.connectError => '검사기가 켜져있는지 확인해주세요.',
        BluetoothStatus.unableError => '다시 시도 해주세요.',
        BluetoothStatus.inspectionError => '다시 시도 해주세요.',
        BluetoothStatus.stripError => '스트립 삽입 후 재검사 버튼을 눌러주세요.',
        BluetoothStatus.cutoff => '기기를 끄거나 조작하지 말아주세요.\n재검색이 필요합니다.',
      };

  Color? get waveColor =>
      switch(this){
        BluetoothStatus.scan => Colors.blue.shade100,
        BluetoothStatus.connect => Colors.orange.shade100,
        BluetoothStatus.inspection => Colors.redAccent.shade100,
        BluetoothStatus.scanError => null,
        BluetoothStatus.connectError => null,
        BluetoothStatus.unableError => null,
        BluetoothStatus.inspectionError => null,
        BluetoothStatus.stripError => null,
        BluetoothStatus.cutoff => null,
      };

  String? get retryBtnLabel =>
      switch(this){
        BluetoothStatus.scan => null,
        BluetoothStatus.connect => null,
        BluetoothStatus.inspection => null,
        BluetoothStatus.scanError => '재 검색',
        BluetoothStatus.connectError => '재 연결',
        BluetoothStatus.unableError => '재 검사',
        BluetoothStatus.inspectionError => '재 검사',
        BluetoothStatus.stripError => '재 검사',
        BluetoothStatus.cutoff => '재 검색',
      };
}


//
// enum BluetoothStatus {
//   scan('blue_state_scan'),
//   connect('blue_state_connect'),
//   inspection('blue_state_inspection'),
//   scanError('blue_state_scanError'),
//   connectError('blue_state_connectError'),
//   unableError('blue_state_unableError'),
//   inspectionError('blue_state_inspectionError'),
//   stripError('blue_state_stripError'),
//   cutoff('blue_state_cutoff');
//
//   const BluetoothStatus(this.message);
//
//   final String message;
// }
