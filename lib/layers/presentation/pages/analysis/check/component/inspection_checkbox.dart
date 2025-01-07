import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../../../common/utils/snackbar_utils.dart';
import '../../../../enums/arrangement_type.dart';
import '../../../../routes/route_path.dart';
import '../../../../widgets/frame_container.dart';
import '../../../../widgets/style_text.dart';
import '../inspection_check_viewmodel.dart';

class InspectionCheckBox extends StatefulWidget {
  final ArrangementType type;
  final bool isActive;
  final double height;

  const InspectionCheckBox({
    super.key,
    required this.type,
    required this.isActive,
    required this.height,
  });

  @override
  State<InspectionCheckBox> createState() => _InspectionCheckBoxState();
}

class _InspectionCheckBoxState extends State<InspectionCheckBox> {
  @override
  Widget build(BuildContext context) {
    return FrameContainer(
      height: widget.height,
      borderColor: widget.isActive ? AppColors.secondColor : AppColors.isUnableColor,
      backgroundColor: AppColors.boxBgColor,
      child: InkWell(
        onTap: () => {
        Vibration.vibrate(duration: 60),// 짧고 가벼운 진동 (60ms)
          if (widget.type == ArrangementType.device){
              context.read<InspectionCheckViewModel>().onChangedDevice(
                startInsepction: () {
                  SnackBarUtils.showProgrssSnackBar(
                    context,
                    seconds: 3,
                  );
                  Future.delayed(3.seconds, () {
                    if (!mounted) return; // 위젯이 비활성화되었으면 작업을 중단
                    context.pop(); // 검사전 준비 화면 pop
                    context.push(RoutePath.bluetooth); // 검사화면으로 이동
                  });
                },
              )
            }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                StyleText(
                  text: widget.isActive ? widget.type.onActiveText : widget.type.offActiveText,
                  softWrap: true,
                  fontWeight: AppDim.weightBold,
                  color: widget.isActive
                      ? AppColors.secondColor
                      : AppColors.blackTextColor,
                  size: AppDim.fontSizeXLarge,
                  align: TextAlign.center,
                ),
                AppDim.heightMedium,
                StyleText(
                  text: widget.isActive ? widget.type.subTitle : widget.type.subTitle,
                  softWrap: true,
                  maxLinesCount: 2,
                  fontWeight: AppDim.weight400,
                  size: AppDim.fontSizeSmall,
                  color: AppColors.blackTextColor,
                  align: TextAlign.center,
                ),
              ],
            ),
            Container(
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(AppDim.large),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: widget.isActive
                        ? AppColors.secondColor
                        : AppColors.isUnableColor,
                    width: 3,
                  )),
              child: Image.asset(
                widget.type.imagePath,
                height: AppDim.imageSmallMedium,
                width: AppDim.imageSmallMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

