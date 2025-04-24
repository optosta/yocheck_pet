import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/enums/date_range_type.dart';

import '../../../widgets/style_text.dart';

class DateRangeToggleSwitch extends StatelessWidget {
  final TabController dateToggleController;

  const DateRangeToggleSwitch({
    super.key,
    required this.dateToggleController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.brightGrey,
        borderRadius: BorderRadius.all(AppConstants.lightRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TabBar(
          controller: dateToggleController,
          indicator: BoxDecoration(
            color: AppColors.whiteTextColor,
            borderRadius: BorderRadius.all(AppConstants.lightRadius),
          ),
          labelColor: AppColors.blackTextColor,
          unselectedLabelStyle: const TextStyle(fontWeight: AppDim.weight400),
          unselectedLabelColor: AppColors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: List.generate(
            DateRangeType.values.length,
            (index) => StyleText(
              text: DateRangeType.values[index].name,
              fontWeight: AppDim.weight500,
            ),
          ),
        ),
      ),
    );
  }
}
