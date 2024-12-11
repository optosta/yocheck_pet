
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';
import 'package:yocheck_pet/layers/presentation/pages/history/history_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/history/component/history_top_tabbar.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/w_future_handler.dart';
import 'component/recent_list_fragment.dart';
import 'component/all_list_fragment.dart';


/// 검사 내역 화면
/// (최근 5개, 전체 검사) 기록을 확인 할 수 있다.
class HistoryView extends StatefulWidget {
  const HistoryView({super.key});

  @override
  State<HistoryView> createState() => _UrineHistoryViewViewState();
}

class _UrineHistoryViewViewState extends State<HistoryView> with TickerProviderStateMixin{

  late final TabController tabController;

  int get tabItemCount => 2;

  @override
  void initState() {
   tabController = TabController(length: tabItemCount, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HistoryViewModel(),
      child: FrameScaffold(
        appBarTitle: 'history'.tr(),
        body: Consumer<HistoryViewModel>(
          builder: (context, provider, child) {
            return FutureHandler(
              isLoading: provider.isLoading,
              isError: provider.isError,
              errorMessage: provider.errorMessage,
              onRetry: () {  },
              child: Padding(
                padding: const EdgeInsets.only(bottom: AppDim.medium),
                child: Column(
                  children: [

                    /// 상단 탭바 (최근 5개, 전체)
                    const Gap(AppDim.medium),
                    HistoryTopTabBar(tabController: tabController),

                    /// 히스토리
                    Expanded(
                        child: Consumer<HistoryViewModel>(
                          builder: (context, provider, child) {
                            return TabBarView(
                              controller: tabController,
                              children:  [
                                /// 최근 5개
                                RecentListFragment(historyList: provider.historyList),

                                /// 전체 리스트
                                AllListFragment(
                                  allScrollController: provider.scrollController,
                                  historyList: provider.historyList,
                                ),
                              ],
                            );
                          },
                        )
                    ),
                    const Gap(AppDim.medium),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
