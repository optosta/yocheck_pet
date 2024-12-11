import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../../../../common/common.dart';
import '../../../../widgets/style_text.dart';


class InspectionHeader extends StatelessWidget {
  const InspectionHeader({super.key});

  String get helloText => '${'insp_hello'.tr()} ${Authorization().name}';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleText(
          text: helloText,
          color: AppColors.primaryColor,
          size: AppDim.fontSizeXxLarge,
          fontWeight: AppDim.weightBold,
        ),
        const Gap(AppDim.xSmall),
        StyleText(
          text: 'insp_connection'.tr(),
          size: AppDim.fontSizeXLarge,
          fontWeight: AppDim.weightBold,
          maxLinesCount: 2,
        ),
      ],
    );
  }
}
