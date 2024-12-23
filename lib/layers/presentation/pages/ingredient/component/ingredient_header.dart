import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../routes/route_path.dart';
import '../../../widgets/result_item_box.dart';
import '../../../widgets/style_text.dart';

class IngredientHeader extends StatelessWidget {
  final String disease;
  final List<String> statusList;

  const IngredientHeader({
    super.key,
    required this.disease,
    required this.statusList,
  });

  String get nameText => '${Authorization().name} ${'analysis_header'.tr()}';

  String get adjText1 => 'adjText1'.tr();

  String get resultText => '"${disease.tr()} "';

  String get adjText2 => 'adjText2'.tr();

  String get emptyText => 'adjEmptyText1'.tr();

  String get emptyText2 => 'adjResultText'.tr();

  String get emptyText3 => 'adjEmptyText2'.tr();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeadText(),
          AppDim.heightSmall,
          _buildResultHorizontalList(),
          AppDim.heightSmall,
          _buildRichTextForDisease(),

          GestureDetector(
            onTap: () => context.push(RoutePath.diseaseinfo),
            child: Container(
              height: AppConstants.buttonHeight50,
              margin: const EdgeInsets.symmetric(horizontal: AppDim.large),
              decoration: BoxDecoration(
                borderRadius: AppConstants.borderLightRadius,
                border: Border.all(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add,
                    color: AppColors.primaryColor,
                    size: AppDim.iconSmall,
                  ),
                  AppDim.widthSmall,

                  StyleText(
                    text: 'view_disease_info'.tr(),
                    color: AppColors.primaryColor,
                    size: AppDim.fontSizeLarge,
                    fontWeight: AppDim.weight500,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildHeadText() {
    return Padding(
      padding: const EdgeInsets.all(AppDim.medium),
      child: StyleText(
        text: nameText,
        size: AppDim.fontSizeXLarge,
        color: AppColors.primaryColor,
        fontWeight: AppDim.weightBold,
        maxLinesCount: 2,
        softWrap: true,
        height: 1.2,
      ),
    );
  }

  _buildResultHorizontalList() {
    return Container(
      height: 130,
      color: AppColors.containerBg,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppDim.small),
        scrollDirection: Axis.horizontal,
        itemCount: statusList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              width: 170,
              margin: const EdgeInsets.only(right: AppDim.small),
              child: ResultItemBox(
                index: index,
                status: statusList[index],
              ));
        },
      ),
    );
  }

  _buildRichTextForDisease() {
    return disease == 'health'
        ? Padding(
            padding: const EdgeInsets.all(AppDim.medium),
            child: RichText(
              text: TextSpan(
                text: emptyText,
                style: _defaultTextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: emptyText2,
                    style: _stateTextStyle(),
                  ),
                  TextSpan(text: emptyText3),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(AppDim.medium),
            child: RichText(
              text: TextSpan(
                text: adjText1,
                style: _defaultTextStyle(),
                children: <TextSpan>[
                  TextSpan(
                    text: resultText,
                    style: _stateTextStyle(),
                  ),
                  TextSpan(text: adjText2),
                ],
              ),
            ),
          );
  }

  TextStyle _defaultTextStyle() {
    return const TextStyle(
      fontSize: AppDim.fontSizeMedium,
      fontWeight: AppDim.weightNormal,
      color: AppColors.blackTextColor,
      fontFamily: 'pretendard',
    );
  }

  TextStyle _stateTextStyle() {
    return const TextStyle(
      fontSize: AppDim.fontSizeMedium,
      fontWeight: AppDim.weight500,
      color: AppColors.lightGreen,
      fontFamily: 'pretendard',
    );
  }
}
