

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/layers/presentation/widget/result_item_box.dart';

import '../../../../../common/common.dart';
import '../widget/frame_container.dart';
import '../widget/style_text.dart';

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
      padding: AppDim.paddingLarge,
      color:  AppColors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyleText(
            text: '✓ 요로감염 체크',
            size: AppDim.fontSizeXLarge,
            color: AppColors.primaryColor,
            fontWeight: AppDim.weightBold,
          ),
          const Gap(AppDim.medium),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ResultItemBox(
                  index: 9,
                  status: status1,
                ),
              ),
              Expanded(
                child: ResultItemBox(
                  index: 5,
                  status: status2,
                ),
              ),

              Expanded( 
                child: StyleText(
                  text: status1 == '0' ? additionalText1 : additionalText2,
                  color: AppColors.blackTextColor,
                  maxLinesCount: 5,
                  softWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}