
import 'package:flutter/material.dart';

import '../../../../../../common/common.dart';
import '../../../widgets/result_item_box.dart';
import '../../../widgets/style_text.dart';

class VitaminInfoBox extends StatelessWidget {
  final String status1;
  final String status2;

  const VitaminInfoBox({
    super.key,
    required this.status1,
    required this.status2,
  });

  String get additionalText1 => '✓ 요로감염 수치가 낮습니다.';
  String get additionalText2 => '✓ 요로감염 수치가 있으며 알카리뇨도 확인바랍니다.';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: AppDim.large),
      color:  AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: AppDim.large, left: AppDim.medium),
            child: StyleText(
              text: 'tract_check'.tr(),
              size: AppDim.fontSizeXLarge,
              color: AppColors.primaryColor,
              fontWeight: AppDim.weightBold,
            ),
          ),
          AppDim.heightMedium,

          Container(
            height: 130,
            padding: const EdgeInsets.all(AppDim.small),
            color: AppColors.containerBg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  child: ResultItemBox(
                    index: 9,
                    status: status1,
                  ),
                ),

                AppDim.widthSmall,

                SizedBox(
                  width: 180,
                  child: ResultItemBox(
                    index: 5,
                    status: status2,
                  ),
                ),
              ],
            ),
          ),
          AppDim.heightMedium,

          Container(
            padding: const EdgeInsets.all(AppDim.small),
            margin: const EdgeInsets.only(left: AppDim.small),
            decoration: BoxDecoration(
              color: AppColors.greyBoxBg,
              borderRadius: AppConstants.borderLightRadius,
            ),
            child: StyleText(
              text: status1 == '0' ? 'tract_grade_1'.tr() : 'tract_grade_2'.tr(),
              color: AppColors.blackTextColor,
              maxLinesCount: 5,
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }

}