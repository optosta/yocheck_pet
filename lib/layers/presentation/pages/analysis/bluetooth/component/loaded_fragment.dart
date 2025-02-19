import 'package:flutter/material.dart';
import 'package:ripple_wave/ripple_wave.dart';

import '../../../../../../common/common.dart';
import '../../../../../model/enum/bluetooth_status.dart';
import '../../../../widgets/style_text.dart';

class LoadedFragment extends StatelessWidget {
  final BluetoothStatus status;

  const LoadedFragment({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /// Title
        Expanded(
          flex: 2,
          child: Center(
            child: StyleText(
              text: status.title,
              size: AppDim.fontSizeXxLarge,
              fontWeight: AppDim.weight600,
            ),
          ),
        ),

        /// 웨이브 에니메이션
        Expanded(
          flex: 5,
          child: RippleWave(
            color: status.waveColor!,
            repeat: true,
            child: Image.asset(
              '${Texts.imagePath}/urine/bluetooth/device.png',
              width: 120,
              height: 120,
            ),
          ),
        ),

        /// subTitle
        Expanded(
          flex: 3,
          child: StyleText(
            text: status.subTitle,
            color: AppColors.secondColor,
            fontWeight: AppDim.weight500,
            softWrap: true,
            maxLinesCount: 2,
            align: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
