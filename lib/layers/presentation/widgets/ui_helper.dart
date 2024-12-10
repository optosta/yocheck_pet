import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:yocheck_pet/layers/presentation/widgets/w_custom_dialog.dart';

import '../../../common/utils/nav.dart';
import '../pages/analysis/result/d_ai_analysis.dart';

class UiHelper {
  static Future<void> showAiAnalysisDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AiAnalysisAlertDialog(),
    );
  }

  static void showErrorDialog(BuildContext context, String message) {
    Nav.doPop(context); // 기존 다이얼로그 닫기
    CustomDialog.showMyDialog(
      title: 'result_analysis'.tr,
      content: message,
      mainContext: context,
    );
  }
}