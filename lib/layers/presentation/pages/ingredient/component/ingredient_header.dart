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

  String get resultText => ' "${disease.tr()} "';

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
          _buildMainPointResulttBoxs(),
          AppDim.heightSmall,
          _buildRichTextForDisease(),
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
    return TextStyle(
      fontSize: AppDim.fontSizeMedium,
      fontWeight: AppDim.weight500,
      color: AppColors.secondColor,
      fontFamily: 'pretendard',
    );
  }

  Widget _buildMainPointResulttBoxs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 240,
        child: Column(
          children: [
            SizedBox(
              height: 110,
              child: Row(
                children: [
                  Expanded(
                    child: ResultItemBox(
                      index: 0,
                      status: statusList[0],
                    ),
                  ),
                  AppDim.widthSmall,

                  Expanded(
                    child: ResultItemBox(
                      index: 4,
                      status: statusList[4],
                    ),
                  ),
                ],
              ),
            ),
            AppDim.heightSmall,

            SizedBox(
              height: 110,
              child: Row(
                children: [
                  Expanded(
                    child: ResultItemBox(
                      index: 1,
                      status: statusList[1],
                    ),
                  ),
                  AppDim.widthSmall,
                  Expanded(
                    child: ResultItemBox(
                      index: 6,
                      status: statusList[6],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
