import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';

import '../../../../../../../common/constant/app_colors.dart';
import '../../../widgets/frame_container.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/style_text.dart';
import '../../../widgets/w_dotted_line.dart';

class ExpandedItem {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  ExpandedItem({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });
}

/// 성분별 관련 질환 정보 화면
class DiseaseInfoView extends StatefulWidget {
  const DiseaseInfoView({super.key});

  @override
  State<DiseaseInfoView> createState() => _DiseaseInfoViewState();
}

class _DiseaseInfoViewState extends State<DiseaseInfoView> {
  @override
  Widget build(BuildContext context) {
    return FrameScaffold(
      appBarTitle: 'related_diseases'.tr(),
      bodyPadding: const EdgeInsets.all(AppDim.xLarge),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            rowContents('blood'.tr(), 'related_blood'.tr()),
            AppDim.heightXLarge,
            rowContents('bilirubin'.tr(), 'related_bilirubin'.tr()),
            AppDim.heightXLarge,
            rowContents('urobilnogen'.tr(), 'related_urobilnogen'.tr()),
            AppDim.heightXLarge,
            rowContents('ketones'.tr(), 'related_ketones'.tr()),
            AppDim.heightXLarge,
            rowContents('protein'.tr(), 'related_protein'.tr()),
            AppDim.heightXLarge,
            rowContents('nitrate'.tr(), 'related_nitrate'.tr()),
            AppDim.heightXLarge,
            rowContents('glucosuria'.tr(), 'related_glucosuria'.tr()),
            AppDim.heightXLarge,
            rowContents('ph'.tr(), 'related_ph'.tr()),
            AppDim.heightXLarge,
            rowContents('gravity'.tr(), 'related_gravity'.tr()),
            AppDim.heightXLarge,
            rowContents('leukocytes'.tr(), 'related_leukocytes'.tr()),
            AppDim.heightXLarge,
            rowContents('vitamins'.tr(), 'related_vitamins'.tr()),
          ],
        ),
      ),
    );
  }

  Widget rowContents(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StyleText(
          text: title,
          fontWeight: AppDim.weightBold,
          size: AppDim.fontSizeLarge,
          maxLinesCount: 2,
          softWrap: true,
        ),
        AppDim.heightXSmall,
        StyleText(
          text: content,
          fontWeight: AppDim.weight400,
          color: AppColors.greyTextColor,
          maxLinesCount: 5,
          height: 1.2,
          softWrap: true,
        ),
      ],
    );
  }
}
