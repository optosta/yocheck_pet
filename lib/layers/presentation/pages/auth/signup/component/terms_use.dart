import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:yocheck_pet/common/constant/app_colors.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';

import '../../../../widgets/style_text.dart';

/// 개인정보저리방침, 서비스이용약관, 약관보기 위젯
class TermsUse extends StatelessWidget {
  final bool isCheckedInfo;
  final bool isCheckedService;
  final Function(bool?) onChangedInfo;
  final Function(bool?) onChangedService;
  final VoidCallback showTerms;

  const TermsUse({
    super.key,
    required this.isCheckedInfo,
    required this.isCheckedService,
    required this.onChangedInfo,
    required this.onChangedService,
    required this.showTerms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppDim.large),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// 이용약관 체크박스
          Flexible(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MSHCheckbox(
                      size: 22,
                      value: isCheckedInfo,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: AppColors.primaryColor,
                      ),
                      style: MSHCheckboxStyle.fillScaleCheck,
                      onChanged: onChangedInfo
                    ),

                    const Gap(AppDim.small),
                    Expanded(
                      child: StyleText(
                        text: 'personal_information'.tr(),
                        maxLinesCount: 2,
                        softWrap: true,
                        fontWeight: AppDim.weight500,
                        color: AppColors.greyTextColor,
                        size: AppDim.fontSizeSmall,
                      ),
                    )
                  ],
                ),
                const Gap(AppDim.medium),

                Row(
                  children: [
                    MSHCheckbox(
                        size: 22,
                        value: isCheckedService,
                        colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                          checkedColor: AppColors.primaryColor,
                        ),
                        style: MSHCheckboxStyle.fillScaleCheck,
                        onChanged: onChangedService
                    ),
                    const Gap(AppDim.small),

                    Expanded(
                      child: StyleText(
                        text: 'service_terms'.tr(),
                        fontWeight: AppDim.weight500,
                        maxLinesCount: 2,
                        softWrap: true,
                        color: AppColors.greyTextColor,
                        size: AppDim.fontSizeSmall,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),

          /// 약관 보기 버튼
          Flexible(
            flex: 4,
            child: TextButton(
              onPressed: showTerms,
              child: StyleText(
                text: 'terms_view'.tr(),
                size: AppDim.fontSizeSmall,
                color: AppColors.primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: AppColors.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
