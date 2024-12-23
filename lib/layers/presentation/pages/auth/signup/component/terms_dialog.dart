import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/login/component/default_button.dart';

import '../../../../../../common/constant/terms_content.dart';
import '../../../../widgets/style_text.dart';

/// 이용약관 다이얼로그
class TermsAlertDialog extends StatelessWidget {
  TermsAlertDialog({super.key});

  final _termsText = TermsContent();

  double get _contentHeight => 270;

  int get _contentMaxLinesCount => 100;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: AppConstants.borderRadius),
      content: SizedBox(
        height: 440,
        width: size.width * 0.9,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(AppDim.large),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StyleText(
                      text: 'title_terms'.tr(),
                      size: AppDim.fontSizeLarge,
                      fontWeight: AppDim.weightBold,
                      color: AppColors.primaryColor,
                    ),

                    // 오른쪽 상단 취소 버튼
                    InkWell(
                      onTap: () => context.pop(),
                      child: const Icon(Icons.close,
                          color: Colors.black, size: AppDim.large),
                    ),
                  ],
                ),
              ),

              Container(
                height: _contentHeight,
                margin: const EdgeInsets.symmetric(horizontal: AppDim.large),
                decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.all(Radius.circular(AppDim.xSmall)),
                    border: Border.all(
                        color: AppColors.greyBoxBorder,
                        width: AppConstants.borderLightWidth)),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(AppDim.medium),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 개인정보 수집 및 이용 동의
                        Padding(
                          padding: const EdgeInsets.only(bottom: AppDim.medium),
                          child: StyleText(
                            text: _termsText.privacyTitle,
                            size: AppDim.fontSizeLarge,
                            fontWeight: AppDim.weightBold,
                          ),
                        ),
                        StyleText(
                          text: _termsText.privacyMainText,
                          size: AppDim.fontSizeSmall,
                          softWrap: true,
                          maxLinesCount: _contentMaxLinesCount,
                        ),

                        /// 민감정보 처리에 대한 동의
                        Padding(
                          padding: const EdgeInsets.only(bottom: AppDim.medium),
                          child: StyleText(
                            text: _termsText.sensitiveTitle,
                            size: AppDim.fontSizeLarge,
                            fontWeight: AppDim.weightBold,
                            softWrap: true,
                            maxLinesCount: 2,
                          ),
                        ),
                        StyleText(
                          text: _termsText.sensitiveMainText,
                          size: AppDim.fontSizeSmall,
                          softWrap: true,
                          maxLinesCount: _contentMaxLinesCount,
                        ),

                        /// 연구과제 설명 및 참여 동의
                        Padding(
                          padding: const EdgeInsets.only(bottom: AppDim.medium),
                          child: StyleText(
                            text: _termsText.researchTitle,
                            size: AppDim.fontSizeLarge,
                            fontWeight: AppDim.weightBold,
                            softWrap: true,
                            maxLinesCount: 2,
                          ),
                        ),
                        StyleText(
                          text: _termsText.researchMainText,
                          size: AppDim.fontSizeSmall,
                          softWrap: true,
                          maxLinesCount: _contentMaxLinesCount,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AppDim.heightLarge,

              DefaultButton(
                onPressed: () => context.pop(),
                lable: 'check'.tr(),
                backgroundColor: AppColors.primaryColor,
                textColor: AppColors.whiteTextColor,
              )

            ],
          ),
        ),
      ),
      contentPadding: const EdgeInsets.all(0),
      actionsAlignment: MainAxisAlignment.end,
      actionsPadding: const EdgeInsets.all(0),
    );
  }
}
