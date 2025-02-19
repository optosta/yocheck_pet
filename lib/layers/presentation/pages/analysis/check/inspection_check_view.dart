import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../enums/arrangement_type.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/style_text.dart';
import 'component/inspection_checkbox.dart';
import 'component/warning_message.dart';
import 'inspection_check_viewmodel.dart';

/// 소변 검사 준비 화면
class InspectionCheckView extends StatelessWidget {
  const InspectionCheckView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (BuildContext context) => InspectionCheckViewModel(),
      child: FrameScaffold(
        appBarTitle: 'insp_title'.tr(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: AppConstants.viewPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// 검사 전 체크 사항(블루투스ON, 검사기ON)
                  Consumer<InspectionCheckViewModel>(
                    builder: (context, provider, child) {
                      return Column(
                        children: [
                          /// 블루투스 ON/OFF 상태 확인
                          InspectionCheckBox(
                            height: size.height * 0.30,
                            type: ArrangementType.bluetooth,
                            isActive: provider.isBluetoothActive,
                          ),
                          AppDim.heightMedium,

                          /// 검사기 ON/OFF 상태 확인
                          InspectionCheckBox(
                            height: size.height * 0.30,
                            type: ArrangementType.device,
                            isActive: provider.isDeviceActive,
                          ),
                        ],
                      );
                    },
                  ),
                  AppDim.heightLarge,
                  /// 소변 검체 시간 경고 문구
                  WarningMessage(
                    backgroundColor: Colors.yellow.shade100,
                  )
                ],
              ),
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
