import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yocheck_pet/common/dart/extension/datetime_extension.dart';

import '../../../../common/utils/branch.dart';
import '../../../../common/utils/dio/dio_exceptions.dart';
import '../../../../common/utils/my_logger.dart';
import '../../../../common/utils/text_format.dart';
import '../../../domain/usecase/urine/urine_chart_usecase.dart';
import '../../../model/authorization.dart';
import '../../../model/vo_chart.dart';

class UrineDefineInfoBottomSheetViewModel extends ChangeNotifier {

  UrineDefineInfoBottomSheetViewModel(String urineLabel){
    loadDescriptionAndChart(urineLabel);
  }

  final String _rangeStartDate = DateTime.now().subtract(90.days).formattedClean;
  final String _rangeEndDate = DateTime.now().formattedClean;

  // future handler parameters
  bool _isLoading = true;
  bool _isError = false;
  String _errorMessage = '';

  // ChartData(x축, y축) List
  final List<ChartData> _chartData = [];

  //urein description list
  List<Map<String, String>>? _urineDesc;

  // future handler parameters getter
  bool get isLoading => _isLoading;
  bool get isError => _isError;
  String get errorMessage => _errorMessage;
  List<Map<String, String>>? get urineDesc => _urineDesc;
  List<ChartData> get chartData => _chartData;

  /// 최근 7일간의 데이터만 조회
  final int dateRange = 7;

  Future<void> loadDescriptionAndChart(String urineLabel) async {
    final toMap = {
      'userType': 'P',
      'userID': Authorization().userID,
      'searchStartDate': _rangeStartDate,
      'searchEndDate': _rangeEndDate,
    };

    try {
      //final loadStringFuture = rootBundle.loadString('assets/json/urine_desc.json');
      final urineChartFuture = await UrineChartCase().execute(toMap);

      // final List futureResults =
      //     await Future.wait([loadStringFuture, urineChartFuture]);

      // String stringRes = futureResults[0];
      // UrineChartDTO? urineChartDTO = futureResults[1];

      // final List<dynamic> data = json.decode(stringRes);
      // _urineDesc = data
      //     .map((item) => {
      //           'title': item['title'].toString(),
      //           'subTitle': item['subTitle'].toString(),
      //           'description': item['description'].toString(),
      //           'label': item['label'].toString(),
      //         })
      //     .toList();

      if (urineChartFuture?.status.code == '200') {
        chartData.clear();

        // 서버에서 불러온데이터를 사용자가 선택한 [_selectedUrineName]를 통해
        // 같은 dataType으로만 골라 x,y축 데이터를 만들어 _chartData에 추가한다.
        for (var value in urineChartFuture!.data) {
          if (value.dataType == Branch.urineLabelToUrineDataType(urineLabel)) {
            if (!_chartData.any((element) => element.x
                .toString()
                .contains(TextFormat.setGroupDateTime(value.datetime)))) {
              if (_chartData.length < dateRange) {
                _chartData.add(ChartData(
                    x: TextFormat.setGroupDateTime(value.datetime),
                    y: int.parse(value.status)));
              }
            }
          }

          if (_chartData.length == dateRange) break;
        }
      } else if (urineChartFuture?.status.code == 'ERR_MS_4003') {
      }
      _isLoading = false;
      notifyListeners();
    } on DioException catch (e) {
      final msg = DioExceptions.fromDioError(e).toString();
      notifyError(msg);
    } catch (e) {
      logger.e(e.toString());
      const msg = '죄송합니다.\n예기치 않은 문제가 발생했습니다.';
      notifyError(msg);
    }
  }

  // Future<void> loadData() async {
  //   _urineDesc.clear();
  //
  //   final String response = await rootBundle.loadString('assets/json/urine_desc.json');
  //   final List<dynamic> data = json.decode(response);
  //   _urineDesc = data.map((item) => {
  //     'title': item['title'].toString(),
  //     'subTitle': item['subTitle'].toString(),
  //     'description': item['description'].toString(),
  //   }).toList();
  //
  //   logger.d(_urineDesc);
  // }






  /// 에러 처리
  notifyError(String message){
  _isLoading = false;
  _errorMessage = message;
  _isError = true;
  notifyListeners();
  }
}
