
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/presentation/home/vm_urine.dart';
import 'package:yocheck_pet/layers/presentation/widget/style_text.dart';

import '../../../../common/common.dart';

class UrineHomeHeader extends StatelessWidget {
  const UrineHomeHeader({super.key});

  String get subTitle => 'home_subtitle'.tr();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.1,
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
              text: subTitle,
              color: AppColors.white,
              size: AppDim.fontSizeLarge,
              align: TextAlign.start
          )
        ],
      ),
    );
  }
}
