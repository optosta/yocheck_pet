import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../model/enum/arrangement_type.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/style_text.dart';
import '../bluetooth/bluetooth_view.dart';
import 'component/inspection_checkbox.dart';
import 'inspection_check_viewmodel.dart';
import 'component/inspection_header.dart';


/// 소변 검사 준비 화면
class InspectionCheckView extends StatelessWidget {
  const InspectionCheckView({super.key});

  List<String> get checkList => [
        'insp_guide_1'.tr(),
        'insp_guide_2'.tr(),
        'insp_guide_3'.tr(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => InspectionCheckViewModel(),
      child: FrameScaffold(
        appBarTitle: 'insp_title'.tr(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: AppConstants.viewPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 검사 준비 헤더
                    const Gap(AppDim.large),
                    const InspectionHeader(),

                    /// 검사 전 체크 사항(블루투스ON, 검사기ON)
                    const Gap(AppDim.xLarge),
                    Consumer<InspectionCheckViewModel>(
                      builder: (context, provider, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            /// 블루투스 ON/OFF 상태 확인
                            Expanded(
                              child: InspectionCheckBox(
                                type: ArrangementType.bluetooth,
                                isCheckBox: provider.isBluetoothActive,
                              ),
                            ),

                            /// 검사기 ON/OFF 상태 확인
                            const Gap(AppDim.large),
                            Expanded(
                              child: InspectionCheckBox(
                                type: ArrangementType.device,
                                isCheckBox: provider.isDeviceActive,
                              ),
                            ),
                          ],
                        );
                      },
                    ),

                    /// 체크리스트
                    const Gap(AppDim.large),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyleText(
                          text: checkList[0],
                          color: AppColors.greyTextColor,
                          softWrap: true,
                          maxLinesCount: 2,
                        ),

                        const Gap(AppDim.xSmall),
                        StyleText(
                          text: checkList[1],
                          color: AppColors.greyTextColor,
                          softWrap: true,
                          maxLinesCount: 2,
                        ),

                        const Gap(AppDim.xSmall),
                        StyleText(
                          text: checkList[2],
                          color: AppColors.greyTextColor,
                          softWrap: true,
                          maxLinesCount: 2,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// 검사 진행 버튼
            Consumer<InspectionCheckViewModel>(
              builder: (context, provider, child) {
                return  Visibility(
                  visible: provider.visibleStartButton,
                  child: DefaultButton(
                      btnName: 'insp_start'.tr(),
                      onPressed: () => {
                        Nav.doPop(context), // 검사전 준비 화면 pop
                        Nav.doPush(context, const BluetoothView())
                      },
                  ),
                );
              },
            ),
            Platform.isAndroid
                ? const Gap(AppDim.large)
                : const Gap(AppDim.xXLarge),
          ],
        ),
      ),
    );
  }
}
