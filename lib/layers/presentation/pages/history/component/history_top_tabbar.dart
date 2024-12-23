import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

/// 히스토리 탭바 (최근, 전체)
class HistoryTopTabBar extends StatelessWidget {
  final TabController tabController;

  const HistoryTopTabBar({
    super.key,
    required this.tabController,
  });

  String get recentText => '최근';
  String get allText => '전체';
  double get tabBarHeight => 45;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: tabBarHeight,
      decoration: BoxDecoration(
        color: AppColors.brightGrey,
        borderRadius: BorderRadius.all(AppConstants.lightRadius),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
            color: AppColors.whiteTextColor,
            borderRadius: BorderRadius.all(AppConstants.lightRadius),
          ),
          labelColor: AppColors.blackTextColor,
          unselectedLabelStyle: const TextStyle(fontWeight: AppDim.weight400),
          unselectedLabelColor: AppColors.grey,
          tabs: [
            Tab(
              text: 'his_recent'.tr(),
            ),

            Tab(
              text: 'his_all'.tr(),
            ),
          ],
        ),
      ),
    );
  }
}
