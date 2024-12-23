import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
      title: 'result_analysis'.tr(),
      content: message,
      mainContext: context,
    );
  }


  /// 기본 다이얼로그
  static void defaultDialog(BuildContext context, String title, String message){
    CustomDialog.showMyDialog(
      title: title,
      content: message,
      mainContext: context,
    );
  }
}