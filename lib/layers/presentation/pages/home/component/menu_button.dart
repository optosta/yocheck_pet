import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../model/enum/home_button_type.dart';
import '../../../enums/home_button_type.dart';
import '../../../widgets/style_text.dart';
import '../../../widgets/ui_helper.dart';
import '../../../widgets/w_custom_dialog.dart';
import '../../analysis/check/inspection_check_view.dart';
import '../../history/history_view.dart';
import '../../trend/analysis_trend_view.dart';
import '../ai_analysis_provider.dart';

class MenuButton extends StatelessWidget {
  final HomeButtonType type;
  final String label;

  const MenuButton({
    super.key,
    required this.type,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        switch (type) {
          case HomeButtonType.inspection:
            checkLocationService(context);
            break;
          case HomeButtonType.history:
            Nav.doPush(context, const HistoryView());
            break;
          case HomeButtonType.ingredient:
            requestFetchAiAnalyze(context);
            break;
          case HomeButtonType.transition:
            Nav.doPush(context, const AnalysisTrendView());
            break;
        }
      },
      child: SizedBox(
        height: 110,
        width: double.infinity,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDim.medium, vertical: AppDim.medium),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(AppConstants.lightRadius),
            color: type == HomeButtonType.inspection
                ? AppColors.secondColor
                : AppColors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 90,
                      padding: const EdgeInsets.all(AppDim.medium),
                      child: Image.asset(type.imagePath),
                  ),

                  StyleText(
                    text: label,
                    color: type == HomeButtonType.inspection
                        ? AppColors.whiteTextColor
                        : AppColors.blackTextColor,
                    maxLinesCount: 2,
                    size: AppDim.fontSizeXLarge,
                    fontWeight: AppDim.weightBold,
                  ),
                ],
              ),

              Icon(
                Icons.arrow_forward_ios_sharp,
                size: AppDim.iconXSmall,
                color: type == HomeButtonType.inspection
                    ? AppColors.whiteTextColor
                    : AppColors.greyColor,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> checkLocationService(BuildContext context) async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled && context.mounted) {
      CustomDialog.showMyDialog(
        title: 'location_info'.tr(),
        content: 'location_content'.tr(),
        mainContext: context,
      );
    } else {
      if (context.mounted) {
        Nav.doPush(context, const InspectionCheckView());
      }
    }
  }

  /// 성분 분석 요청
  void requestFetchAiAnalyze(BuildContext context) {
    final provider = context.read<AiAnalysisProvider>();

    provider.fetchAiAnalyze(
      showLoadingDialog: () => UiHelper.showAiAnalysisDialog(context),
      showErrorDialog: (message) => UiHelper.showErrorDialog(context, message),
      navigateToResult: (resultText, statusList) {
        context.pop(); // 로딩 다이얼로그 닫기
        context.push('/ingredientResult', extra: {
          'resultText': resultText,
          'statusList': statusList
        }); // 성분 분석 결과 페이지로 이동
      },
    );
  }
}
