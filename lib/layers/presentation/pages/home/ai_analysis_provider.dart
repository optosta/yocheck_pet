import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/usecase/urine/urine_ai_analysis_usecase.dart';
import '../../../domain/usecase/urine/urine_result_usecase.dart';
import '../../../entity/urine_result_dto.dart';



class AiAnalysisProvider extends ChangeNotifier {
  Future<void> fetchAiAnalyze({
    required Function showLoadingDialog,
    required Function(String message) showErrorDialog,
    required Function(String resultText, List<String> statusList) navigateToResult,
  }) async {
    showLoadingDialog();

    try {
      final urineResultDTO = await UrineResultCase().execute('');
      if (urineResultDTO?.status.code == '200') {
        final statusList = _mapUrineStatus(urineResultDTO!);
        final toMap = _createUrineAnalysisMap(statusList);
        final result = await UrineAiAnalysisUseCase().execute(toMap);

        if (result != null &&(result != 'ERROR' || result != 'unknown')) {
          Future.delayed(2.seconds, () {
            navigateToResult(result, statusList);
          });
        } else {
          showErrorDialog('정상적으로 처리 되지 않았습니다.\n다시 시도 해주세요.');
        }
      } else {
        showErrorDialog('최근에 검사한 이력이 없습니다.');
      }
    } catch (e) {
      showErrorDialog('정상적으로 처리 되지 않았습니다.\n다시 시도 해주세요.');
    }
  }

  List<String> _mapUrineStatus(UrineResultDTO dto) {
    return dto.data!.map((value) => value.status).toList();
  }

  Map<String, dynamic> _createUrineAnalysisMap(List<String> statusList) {
    return {
      "blood": statusList[0] == '0'|| statusList[0] == '5' ? '-' : '${statusList[0]}+',
      "bilirubin": statusList[1] == '0' || statusList[1] == '5'? '-' : '${statusList[1]}+',
      "urobilinogen": statusList[2] == '0' || statusList[2] == '5'? '-' : '${statusList[2]}+',
      "ketones": statusList[3] == '0' || statusList[3] == '5'? '-' : '${statusList[3]}+',
      "protein": statusList[4] == '0' || statusList[4] == '6'? '-' : '${statusList[4]}+',
      "nitrite": statusList[5] == '1' ? '1+' : '-',
      "glucose": statusList[6] == '0' || statusList[6] == '6'? '-' : '${statusList[6]}+',
      "leukocytes": statusList[9] == '0' || statusList[9] == '5' ? '-' : '${statusList[9]}+',
    };
  }
}



/*

class AiAnalysisProvider extends ChangeNotifier {

  /// 성분 분석: 측정된 소변데이터로
  /// 한밭대학교에서 제공해주는 API 연동
  Future<void> fetchAiAnalyze(BuildContext context) async  {
    showAiAnalysisDialog(context);

    Future.delayed(2.seconds, () async {
      try {
        UrineResultDTO? urineResultDTO = await UrineResultCase().execute('');

        if (urineResultDTO?.status.code == '200') {
          List<String> statusList =
          urineResultDTO!.data!.map((value) => value.status).toList();

          Map<String, dynamic> toMap = {
            "blood": statusList[0] == '0'|| statusList[0] == '5' ? '-' : '${statusList[0]}+',
            "bilirubin": statusList[1] == '0' || statusList[1] == '5'? '-' : '${statusList[1]}+',
            "urobilinogen": statusList[2] == '0' || statusList[2] == '5'? '-' : '${statusList[2]}+',
            "ketones": statusList[3] == '0' || statusList[3] == '5'? '-' : '${statusList[3]}+',
            "protein": statusList[4] == '0' || statusList[4] == '6'? '-' : '${statusList[4]}+',
            "nitrite": statusList[5] == '1' ? '1+' : '-',
            "glucose": statusList[6] == '0' || statusList[6] == '6'? '-' : '${statusList[6]}+',
            "leukocytes": statusList[9] == '0' || statusList[9] == '5' ? '-' : '${statusList[9]}+',
          };

          String? result = await UrineAiAnalysisUseCase().execute(toMap);
          logger.d(toMap);
          if (result != null &&(result != 'ERROR' || result != 'unknown') && context.mounted) {
            Nav.doPop(context); // 성분분석 진행 알림 다이얼로그 pop
            Nav.doPush(context, IngredientResultView(resultText: result, statusList: statusList));
          } else {
            if(context.mounted){
              aiDialog(context, '정상적으로 처리 되지 않았습니다.\n다시 시도 해주세요.');
            }
          }
        } else {
          if(context.mounted){
            aiDialog(context, '최근에 검사한 이력이 없습니다.');
          }
        }
      } catch (e) {
        logger.i('성분분석 : $e');
        if(context.mounted){
          aiDialog(context, '정상적으로 처리 되지 않았습니다.\n다시 시도 해주세요.');
        }}
    });
  }

  /// AI 성분 분석 시작시 보여주는 다이얼로그
  /// 분석 시작시 다른 이벤트 못받게 설정함
  showAiAnalysisDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const AiAnalysisAlertDialog();
      },
    );
  }

  /// ai 성분분석 다이얼로그
  aiDialog(BuildContext context, String message){
    Nav.doPop(context); // showAiAnalysisDialog pop
    CustomDialog.showMyDialog(
      title: 'result_analysis'.tr,
      content: message,
      mainContext: context,
    );
  }
}*/
