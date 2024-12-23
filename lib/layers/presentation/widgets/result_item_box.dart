import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/utils/branch.dart';
import 'package:yocheck_pet/layers/presentation/widgets/style_text.dart';

import '../../../common/constant/app_colors.dart';
import '../../../common/constant/app_constants.dart';
import '../../../common/constant/app_dimensions.dart';
import '../../model/vo_chart.dart';
import 'bottomsheet/v_urine_define_info_bottom_sheet.dart';

class ResultItemBox extends StatelessWidget {
  final int index;
  final String status;
  final List<ChartData>? chartData;

  const ResultItemBox({
    super.key,
    required this.index,
    required this.status,
    this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            enableDrag: true,
            backgroundColor: Colors.transparent,
            builder: (BuildContext context) {
              return UrineDefineInfoBottomSheetView(
                urineLabel: AppConstants.urineLabelList[index],
                index: index,
              );
            })
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(AppConstants.lightRadius)),
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StyleText(
                      text: AppConstants.urineLabelList[index],
                      color: AppColors.blackTextColor,
                      size: AppDim.fontSizeLarge,
                      fontWeight: AppDim.weightBold,
                      maxLinesCount: 2,
                      softWrap: true,
                      align: TextAlign.start,
                    ),
                    AppDim.heightSmall,
                    Container(
                      padding: const EdgeInsets.all(5),
                      constraints: const BoxConstraints(
                        minWidth: 40,
                        minHeight: 20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                        color: Branch.resultStatusToBgColor(status, index),
                      ),
                      child: Center(
                        child: StyleText(
                          text: Branch.resultStatusToText(status, index),
                          color: Branch.resultStatusToColor(status, index),
                          fontWeight: AppDim.weight500,
                          maxLinesCount: 2,
                          softWrap: true,
                          align: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: Colors.grey,
                      size: AppDim.iconXSmall,
                    ),
                    Image.asset(
                      Branch.resultStatusToImagePath(status, index),
                      width: 45,
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
