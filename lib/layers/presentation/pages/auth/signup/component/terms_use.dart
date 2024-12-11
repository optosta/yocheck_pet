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

  String get infoTermsText => '개인정보처리방침 (필수)';
  String get serviceTermsText => '서비스이용약관 (필수)';
  String get viewTerms => '약관보기';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// 이용약관 체크박스
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(AppDim.small),
            Row(
              children: [
                MSHCheckbox(
                  size: 22,
                  value: isCheckedInfo,
                  colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                    checkedColor: AppColors.primaryColor,
                  ),
                  style: MSHCheckboxStyle.stroke,
                  onChanged: onChangedInfo
                ),

                const Gap(AppDim.small),
                StyleText(
                  text: 'personal_information'.tr(),
                  fontWeight: AppDim.weight500,
                  color: AppColors.greyTextColor,
                  size: AppDim.fontSizeSmall,
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
                    style: MSHCheckboxStyle.stroke,
                    onChanged: onChangedService
                ),
                const Gap(AppDim.small),

                StyleText(
                  text: 'service_terms'.tr(),
                  fontWeight: AppDim.weight500,
                  color: AppColors.greyTextColor,
                  size: AppDim.fontSizeSmall,
                )
              ],
            )
          ],
        ),

        /// 약관 보기 버튼
        TextButton(
          onPressed: showTerms,
          child: StyleText(
            text: 'terms_view'.tr(),
            color: AppColors.primaryColor,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryColor,
          ),
        )
      ],
    );
  }
}
