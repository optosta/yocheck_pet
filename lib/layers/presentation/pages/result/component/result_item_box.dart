import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../common/common.dart';
import '../../../../../common/utils/branch.dart';
import '../../../../model/vo_chart.dart';
import '../../../widgets/style_text.dart';
import '../../../widgets/w_dotted_line.dart';

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
        // showModalBottomSheet(
        //     isScrollControlled: true,
        //     context: context,
        //     enableDrag: true,
        //     backgroundColor: Colors.transparent,
        //     builder: (BuildContext context) {
        //       return UrineDefineInfoBottomSheetView(
        //         urineLabel: AppConstants.urineLabelList[index],
        //         index: index,
        //       );
        //     })
      },
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(
              color: Branch.resultStatusToColor(status, index),
              width: 1.5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(5),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: StyleText(
                          text: AppConstants.urineLabelList[index],
                          color: AppColors.blackTextColor,
                          fontWeight: AppDim.weight500,
                          maxLinesCount: 1,
                          softWrap: true,
                          align: TextAlign.start),
                    ),
                    const Gap(3),
                    const Icon(Icons.info_outline, color: Colors.grey, size: 20),
                  ],
                ),
                const DottedLine(mWidth: double.infinity,),
                const Gap(5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Expanded(
                    //   child: Icon(
                    //     Branch.resultStatusToIconData(status, index),
                    //     color: Branch.resultStatusToColor(status, index),
                    //     size: 35,
                    //   ),
                    // ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Branch.resultStatusToBgColor(status, index),
                        ),
                        child: SizedBox(
                          width: 40,
                          child: Center(
                            child: StyleText(
                              text: Branch.resultStatusToText(status, index),
                              color: Branch.resultStatusToColor(status, index),
                              fontWeight: AppDim.weightBold,
                              size: AppDim.fontSizeSmall,
                              maxLinesCount: 2,
                              softWrap: true,
                              align: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
