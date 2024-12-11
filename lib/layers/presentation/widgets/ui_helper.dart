import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:yocheck_pet/layers/presentation/widgets/w_custom_dialog.dart';

import '../pages/result/component/ai_analysis_dialog.dart';

class UiHelper {
  static Future<void> showAiAnalysisDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AiAnalysisAlertDialog(),
    );
  }

  static void showErrorDialog(BuildContext context, String message) {
    context.pop(); // 기존 다이얼로그 닫기
    CustomDialog.showMyDialog(
      title: 'result_analysis'.tr,
      content: message,
      mainContext: context,
    );
  }


  /// 로그인 다이얼로그
  static void loginDialog(BuildContext context, String message){
    CustomDialog.showMyDialog(
      title: 'login'.tr,
      content: message,
      mainContext: context,
    );
  }
}