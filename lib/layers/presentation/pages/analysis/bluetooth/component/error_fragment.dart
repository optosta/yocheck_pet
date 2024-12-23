import 'package:flutter/material.dart';

import '../../../../../../common/common.dart';
import '../../../../../model/enum/bluetooth_status.dart';
import '../../../../widgets/default_button.dart';
import '../../../../widgets/style_text.dart';

class ErrorFragment extends StatelessWidget {
  final BluetoothStatus status;

  const ErrorFragment({
    super.key,
    required this.status
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          /// title
          StyleText(
            text: status.title,
            size: AppDim.fontSizeXxxLarge,
            fontWeight: AppDim.weight600,
          ),
          AppDim.heightXLarge,

          /// error image
          Image.asset(
           '${Texts.imagePath}/urine/bluetooth/device.png',
            width: 120,
            height: 120,
          ),
          AppDim.heightXLarge,
          AppDim.heightXLarge,
          AppDim.heightXLarge,

          /// subTitle
          StyleText(
            text: status.subTitle,
            color: AppColors.secondColor,
            fontWeight: AppDim.weight400,
            size: AppDim.fontSizeSmall,
            softWrap: true,
            maxLinesCount: 2,
            align: TextAlign.center,
          ),

          DefaultButton(
            btnName: status.retryBtnLabel!,
            onPressed: ()=>{},//provider.onPressedError,
          )
        ],
      ),
    );
  }
}
