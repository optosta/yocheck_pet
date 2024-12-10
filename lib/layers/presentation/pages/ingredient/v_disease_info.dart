import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';

import '../../../../../../common/constant/app_colors.dart';
import '../../widgets/frame_container.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/style_text.dart';
import '../../widgets/w_dotted_line.dart';

class ExpandedItem {
  String expandedValue;
  String headerValue;
  bool isExpanded;

  ExpandedItem({required this.expandedValue, required this.headerValue, this.isExpanded = false});
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDim.medium),
          child: FrameContainer(
            backgroundColor: AppColors.greyBoxBg,
            borderColor: AppColors.brightGrey,
            child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    rowContents('blood'.tr(), 'related_blood'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('bilirubin'.tr(), 'related_bilirubin'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('urobilnogen'.tr(), 'related_urobilnogen'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('ketones'.tr(), 'related_ketones'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('protein'.tr(), 'related_protein'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('nitrate'.tr(), 'related_nitrate'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('glucosuria'.tr(), 'related_glucosuria'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('ph'.tr(), 'related_ph'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('gravity'.tr(), 'related_gravity'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('leukocytes'.tr(), 'related_leukocytes'.tr()),
                    const DottedLine(mWidth: double.infinity),

                    rowContents('vitamins'.tr(), 'related_vitamins'.tr()),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }

  Widget rowContents(String title, String content) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: StyleText(
                  text: title,
                  fontWeight: AppDim.weightBold,
                  size: AppDim.fontSizeLarge,
                  maxLinesCount: 2,
                  softWrap: true,
                ),
              ),
              const Gap(10),

              Expanded(
                flex: 7,
                child: StyleText(
                  text: content,
                  fontWeight: AppDim.weight500,
                  color: AppColors.greyTextColor,
                  size: AppDim.fontSizeLarge,
                  maxLinesCount: 5,
                  height: 1.2,
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




