import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/branch.dart';
import 'package:yocheck_pet/layers/presentation/enums/urine_item_type.dart';

import '../../../widgets/bottomsheet/v_urine_define_info_bottom_sheet.dart';
import '../../../widgets/style_text.dart';
import 'level_gauge_item.dart';

class UrineResultListItem extends StatelessWidget {
  final int index;
  final String status;

  const UrineResultListItem({
    Key? key,
    required this.index,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
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
        height: 50,
        padding: const EdgeInsets.all(AppDim.xSmall),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// 항목
              SizedBox(
                width: 100,
                child: StyleText(
                  maxLinesCount: 2,
                  softWrap: true,
                  text: AppConstants.urineLabelList[index],
                  fontWeight: AppDim.weight400,
                  color: AppColors.blackTextColor,
                  align: TextAlign.start,
                ),
              ),
              AppDim.widthSmall,
              Expanded(
                child: Container(
                  height: 35,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: UrineItemType.values[index] == UrineItemType.nitrate
                        ? _buildLevelGaugeNitrate()
                        : _buildLevelGaugeCommon(index)
                  ),
                ),
              ),

              AppDim.widthSmall,

              /// 결과 Text
              Container(
                constraints: const BoxConstraints(
                  minWidth: 50,
                  maxWidth: 50,
                  minHeight: 20,
                ),
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  color: Branch.resultStatusToBgColor(status, index),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: StyleText(
                    text: Branch.resultStatusToText(status, index),
                    color: Branch.resultStatusToColor(status, index),
                    fontWeight: AppDim.weightBold,
                    maxLinesCount: 2,
                    softWrap: true,
                    align: TextAlign.center,
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  _buildLevelGaugeCommon(int index) {
    int statusIndex = 0;
    if(index == 8){
      switch(int.parse(status)){
        case 0:
        case 1: statusIndex = 0;
        case 2: statusIndex = 1;
        case 3: statusIndex = 2;
        case 4: statusIndex = 3;
        case 5:
        case 6:
        case 7: statusIndex = 4;
      }
    } else {
      statusIndex = int.parse(status) > 4 ?  4 : int.parse(status);
    }

    return List.generate(
      5,
      (pos) => Container(
        width: 25,
        height: 25,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: (index == 7 || index ==  8 || index == 10)?
              AppColors.levelGrayColors[statusIndex][pos]
              : AppColors.level5Colors[statusIndex][pos]),
      ),
    );
  }

  _buildLevelGaugeNitrate() {
    return List.generate(
      2,
      (pos) => Expanded(
        child: Container(
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: AppColors.level2Colors[int.parse(status)][pos]),
        ),
      ),
    );
  }
}
