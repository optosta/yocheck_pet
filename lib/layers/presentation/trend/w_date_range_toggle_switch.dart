import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yocheck_pet/common/common.dart';

class DateRangeToggleSwitch extends StatelessWidget {
  final int toggleIndex;
  final Function(int?) onToggle;

  const DateRangeToggleSwitch({
    super.key,
    required this.toggleIndex,
    required this.onToggle,
  });

  List<String> get toggleLabel => [
    'period_direct'.tr(),
    'period_week'.tr(),
    'period_month'.tr(),
    'period_six_month'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SizedBox(
        height: AppConstants.dropButtonHeight,
        child: Row(
          children: [
            ToggleSwitch(
              cornerRadius: AppConstants.radiusValue10,
              initialLabelIndex: toggleIndex,
              totalSwitches: 4,
              minWidth: width / 4 -11 ,
              inactiveBgColor: Colors.grey.shade200,
              activeBgColor: [AppColors.primaryColor],
              labels: toggleLabel,
              fontSize: AppDim.fontSizeXSmall,
              onToggle: onToggle,
            ),
          ],
        ),
      ),
    );
  }

}
