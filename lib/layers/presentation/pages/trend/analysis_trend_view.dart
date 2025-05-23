
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';
import 'package:yocheck_pet/layers/presentation/enums/date_range_type.dart';
import 'package:yocheck_pet/layers/presentation/enums/urine_item_type.dart';
import 'package:yocheck_pet/layers/presentation/pages/trend/analysis_trend_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/trend/component/date_range_box.dart';
import 'package:yocheck_pet/layers/presentation/pages/trend/component/date_range_toggle_switch.dart';

import '../../../../common/constant/app_colors.dart';
import '../../widgets/default_button.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/style_text.dart';
import 'component/horizontal_urine_chart.dart';
import 'component/urine_item_drop_button.dart';
import 'component/urine_item_tabbar.dart';

/// 검사 내역 추이 화면
class AnalysisTrendView extends StatefulWidget {
  const AnalysisTrendView({super.key});

  @override
  State<AnalysisTrendView> createState() => _AnalysisTrendViewState();
}

class _AnalysisTrendViewState extends State<AnalysisTrendView> with TickerProviderStateMixin {

  late final TabController urineController;
  late final TabController dateToggleController;

  @override
  void initState() {
    super.initState();
    urineController = TabController(length: UrineItemType.values.length, vsync: this);
    dateToggleController = TabController(length: DateRangeType.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {



    return ChangeNotifierProvider(
      create: (BuildContext context) => AnalysisTrendViewModel(),
      child: FrameScaffold(
        appBarTitle: 'trends_title'.tr(),
        backgroundColor: AppColors.greyBoxBg,
        bodyPadding: const EdgeInsets.all(0),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                padding: AppDim.paddingMedium,
                color:  AppColors.white,
                child: Consumer<AnalysisTrendViewModel>(
                  builder: (context, provider, child) {

                    urineController.addListener(() {
                      if(urineController.indexIsChanging){
                        provider.selectedUrineName = UrineItemType.values[urineController.index].name;
                      }
                    });

                    dateToggleController.addListener(() {
                      if(dateToggleController.indexIsChanging){
                        provider.onToggle(dateToggleController.index);
                      }
                    });

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UrineItemTabbar(
                            controller: urineController,
                        ),
                        const Gap(AppDim.medium),

                        /// 날짜 간편 조회
                        DateRangeToggleSwitch(
                          dateToggleController: dateToggleController,
                        ),


                        const Gap(AppDim.medium),

                        /// 검사 항목, 날짜 범위
                        Row(
                          children: [
                            /// 검색 버튼
                            Flexible(
                              flex: 8,
                                child: DateRangeBox(
                                  onTap: () => provider.showDateRangeDialog(context),
                                  dateText: '${provider.uiStartDate} ~ ${provider.uiEndDate}',
                                )
                            ),
                            AppDim.widthMedium,

                            Flexible(
                              flex: 2,
                              child: DefaultButton(
                                  btnName: 'search'.tr(),
                                  buttonHeight: 45,
                                  onPressed: () => provider.fetchUrineChartDio(context)
                              ),
                            ),
                          ],
                        ),



                        /// 추이 차트
                        HorizontalUrineChart(
                          chartData: provider.chartData,
                          addWidthChartLength: provider.addWidthChartLength,
                        ),
                        const Gap(AppDim.medium),

                        StyleText(
                          text: 'tip'.tr(),
                          color: AppColors.blackTextColor,
                          fontWeight: AppDim.weightBold,
                          align: TextAlign.start,
                          // decoration: TextDecoration.underline,
                          // decorationColor: Colors.red.withOpacity(0.3),
                          // decorationThickness: 5,
                        ),

                        const Gap(AppDim.medium),
                      ],
                    );
                  },
                ),
              ),

              /// 더 알아보기
              // const LearnMoreBox(),
              // const Gap(AppDim.xXLarge),

            ],
          ),
        ),
      ),
    );
  }
}
