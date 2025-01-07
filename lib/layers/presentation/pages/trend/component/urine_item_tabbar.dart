import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../enums/urine_item_type.dart';
import '../../../widgets/style_text.dart';

class UrineItemTabbar extends StatelessWidget {
  final TabController controller;

  const UrineItemTabbar({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      controller: controller,
      indicator: BoxDecoration(
          color: AppColors.tabGgColor,
          borderRadius: BorderRadius.all(AppConstants.lightRadius),
          border: Border.all(color: AppColors.primaryColor, width: 1)),
      labelColor: AppColors.primaryColor,
      unselectedLabelStyle: const TextStyle(fontWeight: AppDim.weight400),
      unselectedLabelColor: AppColors.grey,
      tabs: List.generate(
        UrineItemType.values.length,
        (index) => SizedBox(
          height: 35,
          child: Center(
            child: StyleText(
              text: UrineItemType.values[index].name,
              fontWeight: AppDim.weight600,
            ),
          ),
        ),
      ),
    );
  }
}
