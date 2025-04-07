import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/branch.dart';
import 'package:yocheck_pet/layers/presentation/enums/urine_item_type.dart';

import '../../../widgets/bottomsheet/v_urine_define_info_bottom_sheet.dart';
import '../../../widgets/style_text.dart';

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
    Size size = MediaQuery.of(context).size;

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
        height: size.height * 0.068,
        padding: const EdgeInsets.symmetric(vertical: AppDim.xSmall),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// 항목
              Expanded(
                flex: 4,
                child: StyleText(
                  maxLinesCount: 2,
                  softWrap: true,
                  text: AppConstants.urineLabelList[index],
                  fontWeight: AppDim.weight400,
                  color: AppColors.blackTextColor,
                  align: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              AppDim.widthSmall,

              Expanded(
                flex: 5,
                child: Container(
                  height: size.height * 0.04,
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
                      children:
                          UrineItemType.values[index] == UrineItemType.nitrate
                              ? _buildLevelGaugeNitrate()
                              : UrineItemType.values[index] == UrineItemType.gravity ||
                                      UrineItemType.values[index] == UrineItemType.ph
                                  ? _buildLevel2()
                                  : _buildLevelGaugeCommon(index),
                  ),
                ),
              ),
              AppDim.widthMedium,

              /// 결과 text
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 자식 크기에 맞춰 Row 크기 조정
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(5)),
                        color: Branch.resultStatusToBgColor(status, index),
                      ),
                      child: StyleText(
                        text: Branch.resultStatusToText(status, index),
                        color: Branch.resultStatusToColor(status, index),
                        fontWeight: AppDim.weightBold,
                        maxLinesCount: 2,
                        softWrap: true,
                        align: TextAlign.center,
                      ),
                    ),
                  ],
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
      4,
      (pos) => Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(3.0),
        decoration: BoxDecoration(
            color: (index == 10)?
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
          margin: const EdgeInsets.all(9.0),
          decoration: BoxDecoration(
              color: AppColors.level2GrayColors[int.parse(status)][pos]),
        ),
      ),
    );
  }
  _buildLevel2() {
    return List.generate(
      2,
          (pos) => Expanded(
        child: Container(
          margin: const EdgeInsets.all(9.0),
          decoration: BoxDecoration(
              color: AppColors.level2Colors[int.parse(status)][pos]),
        ),
      ),
    );
  }

}
