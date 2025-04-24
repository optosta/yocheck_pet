import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../widgets/style_text.dart';

/// 히스토리 탭바 (최근, 전체)
class HistoryTopTabBar extends StatelessWidget {
  final TabController tabController;

  const HistoryTopTabBar({
    super.key,
    required this.tabController,
  });

  double get _tabBarHeight => 45;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _tabBarHeight,
      decoration: BoxDecoration(
        color: AppColors.brightGrey,
        borderRadius: BorderRadius.all(AppConstants.lightRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TabBar(
          controller: tabController,
          indicatorWeight: 0,
          indicator: BoxDecoration(
            color: AppColors.whiteTextColor,
            borderRadius: BorderRadius.all(AppConstants.lightRadius),
          ),
          labelColor: AppColors.blackTextColor,
          unselectedLabelStyle: const TextStyle(fontWeight: AppDim.weight400),
          unselectedLabelColor: AppColors.grey,
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          tabs: [
            StyleText(
              text: 'his_recent'.tr(),
              fontWeight: AppDim.weight500,
            ),
            StyleText(
              text: 'his_all'.tr(),
              fontWeight: AppDim.weight500,
            )
          ],
        ),
      ),
    );
  }
}
