
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../widgets/style_text.dart';

/// Ai 분석 진행 다이얼로그
class AiAnalysisAlertDialog extends StatelessWidget {
  const AiAnalysisAlertDialog({super.key});

  String get contentText => '${Authorization().name} ${'analysis_dialog'.tr()}';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async {
        return false; // 뒤로가기 방지
      },
      child: AlertDialog(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDim.large)),
        content: SizedBox(
          width: width * 0.7,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(AppDim.xXLarge),
                StyleText(
                  text: 'result_analysis'.tr(),
                  size: AppDim.fontSizeLarge,
                  fontWeight: AppDim.weightBold,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: SpinKitFadingFour(
                      color: AppColors.primaryColor,
                      size: 70
                  ),
                ),
                StyleText(
                    text: contentText,
                    color: AppColors.primaryColor,
                    fontWeight: AppDim.weightBold,
                ),
                const Gap(AppDim.xLarge),

              ],
            ),
          ),
        ),
        contentPadding: const EdgeInsets.all(0),
        actionsAlignment: MainAxisAlignment.end,
        actionsPadding: const EdgeInsets.all(0),
      ),
    );
  }
}
