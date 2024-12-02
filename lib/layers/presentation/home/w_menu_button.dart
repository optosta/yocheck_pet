import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/trend/v_analysis_trend.dart';
import 'package:yocheck_pet/layers/presentation/widget/style_text.dart';
import 'package:yocheck_pet/layers/presentation/widget/w_custom_dialog.dart';

import '../../model/enum/home_button_type.dart';
import '../analysis/arrangement/v_inspection_arrangement.dart';
import '../history/v_urine_history.dart';
import 'vm_urine.dart';


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
    var provider = Provider.of<UrineViewModel>(context);

      return Expanded(
        child: InkWell(
          onTap: ()  {
            if(type == HomeButtonType.inspection) {
              checkLocationService(context);
            } else if(type == HomeButtonType.history){
              Nav.doPush(context, const UrineHistoryView());
            } else if(type == HomeButtonType.ingredient){
              provider.fetchAiAnalyze(context);
            } else if(type == HomeButtonType.transition) {
              Nav.doPush(context, const AnalysisTrendView());
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
        Nav.doPush(context, const InspectionArrangementView());
      }
    }
  }
}
