
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/v_disease_info.dart';

import '../../../../common/common.dart';
import '../../widgets/default_button.dart';
import '../../widgets/style_text.dart';

class DiseaseBox extends StatelessWidget {
  const DiseaseBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDim.paddingLarge,
      color:  AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyleText(
            text: 'diseases_component'.tr(),
            size: AppDim.fontSizeXLarge,
            color: AppColors.primaryColor,
            fontWeight: AppDim.weightBold,
          ),

          const Gap(AppDim.medium),
          Row(
            children: [
              Image.asset('assets/images/urine/disease.png', width: 70),
              const Gap(AppDim.medium),

              Expanded(
                child: Column(
                  children: [
                    DefaultButton(
                      btnName: '${'view_disease_info'.tr()}   ->',
                      buttonHeight: 45,
                      onPressed: () => Nav.doPush(context, const DiseaseInfoView()),
                    ),
                    const Gap(AppDim.small),
                    StyleText(
                      text: 'disease_grade'.tr(),
                      maxLinesCount: 2,
                      softWrap: true,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
