
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/presentation/home/vm_urine.dart';
import 'package:yocheck_pet/layers/presentation/widget/style_text.dart';

import '../../../../common/common.dart';

class UrineHomeHeader extends StatelessWidget {
  const UrineHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.12,
      margin: const EdgeInsets.only(left: AppDim.large),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
        [
          const Gap(AppDim.medium),

          Row(
            children: [
              Consumer<UrineViewModel>(
                builder: (context, provider, child) {
                  return StyleText(
                      text: provider.userName,
                      color: AppColors.white,
                      size: AppDim.fontSizeXxLarge,
                      fontWeight: AppDim.weightBold,
                      align: TextAlign.start
                  );
                },
              ),
            ],
          ),
          const Gap(AppDim.xSmall),

          StyleText(
              text: 'home_subtitle'.tr(),
              softWrap: true,
              maxLinesCount: 2,
              color: AppColors.white,
              size: AppDim.fontSizeLarge,
              align: TextAlign.start
          )
        ],
      ),
    );
  }
}
