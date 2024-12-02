import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/analysis/result/vm_urine_result.dart';
import 'package:yocheck_pet/layers/presentation/analysis/result/w_urine_result_item.dart';
import 'package:yocheck_pet/layers/presentation/widget/default_button.dart';
import 'package:yocheck_pet/layers/presentation/widget/scaffold/frame_scaffold.dart';
import 'package:yocheck_pet/layers/presentation/widget/style_text.dart';

/// 검사 결과 화면 (검사기와 검사후, 히스토리에서 터치 이벤트시)
class UrineResultView extends StatefulWidget {

  /// 검사 결과 리스트
  final List<String> urineList;

  /// 검사 날짜
  final String testDate;

  const UrineResultView({
    super.key,
    required this.urineList,
    required this.testDate,
  });

  @override
  State<UrineResultView> createState() => _UrineResultViewState();
}

class _UrineResultViewState extends State<UrineResultView> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => UrineResultViewModel(context),
      child: FrameScaffold(
        appBarTitle: 'result_title'.tr(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 24.07.27 검사 결과 요약 차트 비활성화
              // Consumer<UrineResultViewModel>(
              //   builder: (context, provider, child) {
              //     return ResultSummaryChart(chartData: provider.chartData);
              //   },
              // ),
              // const Gap(AppDim.large),

              const Gap(AppDim.small),
              StyleText(
                text: 'header_title'.tr(),
                color: AppColors.primaryColor,
                size: AppDim.fontSizeXxLarge,
                fontWeight: AppDim.weightBold,
                maxLinesCount: 2,
                height: 1.2,
              ),
              const Gap(AppDim.xSmall),

              /// 검사 결과 리스트
              SizedBox(
                height: 550,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 11,
                  itemBuilder: (BuildContext context, int index) {
                    return UrineResultListItem(
                      status: widget.urineList[index],
                      index: index,
                    );
                  },
                ),
              ),
              const Gap(AppDim.xXLarge),

              StyleText(
                text: 'result_grade_1'.tr(),
                size: AppDim.fontSizeLarge,
                color: AppColors.blackTextColor,
                fontWeight: AppDim.weight500,
                softWrap: true,
                maxLinesCount: 2,
              ),
              const Gap(AppDim.medium),

              StyleText(
                text: 'result_grade_2'.tr(),
                size: AppDim.fontSizeLarge,
                color: AppColors.blackTextColor,
                fontWeight: AppDim.weight500,
                softWrap: true,
                maxLinesCount: 2,
              ),
              const Gap(AppDim.xSmall),

              /// 성분 분석 버튼
              const Gap(AppDim.xLarge),
              Consumer<UrineResultViewModel>(
                builder: (context, provider, child) {
                  return  DefaultButton(
                    btnName: 'result_analysis'.tr(),
                    onPressed: () {
                      provider.fetchAiAnalyze(widget.urineList);
                    }, // 성분분석 결과 화면 이동
                  );
                },
              ),
              const Gap(AppDim.xXLarge),

            ],
          ),
        ),
      ),
    );
  }
}
