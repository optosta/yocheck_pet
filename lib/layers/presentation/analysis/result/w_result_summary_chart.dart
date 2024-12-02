
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/model/vo_chart.dart';
import 'package:yocheck_pet/layers/presentation/widget/frame_container.dart';
import 'package:yocheck_pet/layers/presentation/widget/line_chart.dart';
import 'package:yocheck_pet/layers/presentation/widget/w_vertical_line.dart';

import '../../widget/style_text.dart';


/// 과거 7개의 검사 결과 추이
class ResultSummaryChart extends StatelessWidget {
  final List<ChartData> chartData;

  const ResultSummaryChart({
    super.key,
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 160,
            child: BarChart().buildColumnSeriesMiniChart(chartData: chartData)
        ),
        const Gap(AppDim.large),

        StyleText(
          text: 'guide1'.tr(),
          size: AppDim.fontSizeSmall,
          color: AppColors.greyTextColor,
          fontWeight: AppDim.weight500,
        ),
        const Gap(AppDim.xSmall),

        StyleText(
          text: 'guide2'.tr(),
          size: AppDim.fontSizeSmall,
          color: AppColors.greyTextColor,
          fontWeight: AppDim.weight500,
        ),
        const Gap(AppDim.xSmall),

        StyleText(
          text: 'guide3'.tr(),
          size: AppDim.fontSizeSmall,
          color: AppColors.greyTextColor,
          fontWeight: AppDim.weight500,
          maxLinesCount: 2,
          softWrap: true,
        ),
      ],
    );
  }
}


