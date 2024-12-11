import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../model/enum/home_button_type.dart';
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
    var size = MediaQuery.of(context).size;

      return Expanded(
        child: InkWell(
          onTap: ()  {
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
            height: size.height * 0.22,
            child: Card(
              color: const Color(0xFFf7f7f7),
              shape: RoundedRectangleBorder(
                borderRadius: AppConstants.borderMediumRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(AppDim.large),
                      child: Image.asset(type.imagePath),

                    ),
                  ),

                  SizedBox(
                    height: size.height * 0.052,
                    child: StyleText(
                        text: label,
                        softWrap: true,
                        maxLinesCount: 2,
                        size: AppDim.fontSizeMedium,
                        fontWeight: AppDim.weightBold,
                        align: TextAlign.center,
                    ),
                  ),
                ],
              ),
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
    }
    else {
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
        context.push('/ingredientResult', extra: {'resultText': resultText, 'statusList': statusList}); // 성분 분석 결과 페이지로 이동
      },
    );
  }
}
