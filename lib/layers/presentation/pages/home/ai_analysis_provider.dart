import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/num_extensions.dart';

import '../../../domain/usecase/urine/urine_ai_analysis_usecase.dart';
import '../../../domain/usecase/urine/urine_result_usecase.dart';
import '../../../entity/urine_result_dto.dart';

class AiAnalysisProvider extends ChangeNotifier {
  late Function(String message) showErrorDialog;
  late Function(String resultText, List<String> statusList) navigateToResult;

  Future<void> fetchAiAnalyze({
    required Function showLoadingDialog,
    required Function(String message) showErrorDialog,
    required Function(String resultText, List<String> statusList) navigateToResult,
    List<String>? statusList
  }) async {
    this.showErrorDialog = showErrorDialog;
    this.navigateToResult = navigateToResult;
    showLoadingDialog();

    try {
      // statusList가 null이 아닌 경우 그대로 사용
      final effectiveStatusList = statusList ?? await _fetchStatusListFromApi();
      if (effectiveStatusList.isNotEmpty) {
        analyzeAndNavigate(effectiveStatusList);
      } else {
        showErrorDialog('empty_recent_history'.tr());
      }
    } catch (e) {
      showErrorDialog('unexpected_error'.tr());
    }
  }


  /// API 호출을 통해 상태 리스트를 가져오는 메서드
  Future<List<String>> _fetchStatusListFromApi() async {
    final urineResultDTO = await UrineResultCase().execute('');
    if (urineResultDTO?.status.code == '200') {
      return _mapUrineStatus(urineResultDTO!);
    } else {
      return [];
    }
  }

  /// 상태 리스트를 받아 분석 및 화면 이동 처리
  Future<void> analyzeAndNavigate(List<String> statusList) async {
    final analysisMap = createUrineAnalysisMap(statusList);

    final result = await UrineAiAnalysisUseCase().execute(analysisMap);
    if (result != null && (result != 'ERROR' || result != 'unknown')) {
      Future.delayed(2.seconds, () {
        navigateToResult(result, statusList);
      });
    } else {
      showErrorDialog('unexpected_error'.tr());
    }
  }

  /// Status 리스트를 Map으로 변환 (독립적으로 사용 가능)
  Map<String, String> createUrineAnalysisMap(List<String> statusList) {
    return {
      "blood": statusList[0] == '0' || statusList[0] == '5'
          ? '-'
          : '${statusList[0]}+',
      "bilirubin": statusList[1] == '0' || statusList[1] == '5'
          ? '-'
          : '${statusList[1]}+',
      "urobilinogen": statusList[2] == '0' || statusList[2] == '5'
          ? '-'
          : '${statusList[2]}+',
      "ketones": statusList[3] == '0' || statusList[3] == '5'
          ? '-'
          : '${statusList[3]}+',
      "protein": statusList[4] == '0' || statusList[4] == '6'
          ? '-'
          : '${statusList[4]}+',
      "nitrite": statusList[5] == '1' ? '1+' : '-',
      "glucose": statusList[6] == '0' || statusList[6] == '6'
          ? '-'
          : '${statusList[6]}+',
      "leukocytes": statusList[9] == '0' || statusList[9] == '5'
          ? '-'
          : '${statusList[9]}+',
    };
  }

  List<String> _mapUrineStatus(UrineResultDTO dto) {
    return dto.data!.map((value) => value.status).toList();
  }
}
