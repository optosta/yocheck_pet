import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/presentation/pages/analysis/bluetooth/bluetooth_viewmodel2.dart';

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
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          const SizedBox(height: 100),

          /// Title
          StyleText(
            text: status.title,
            size: AppDim.fontSizeXLarge,
            fontWeight: AppDim.weight600,
          ),
          const SizedBox(height: 80),

          /// error image
          Image.asset(
            status.errorImage!,
            width: size.width * 0.75,
          ),
          const SizedBox(height: 100),

          /// subTitle
          StyleText(
            text: status.subTitle,
            color: AppColors.secondColor,
            fontWeight: AppDim.weight400,
            softWrap: true,
            maxLinesCount: 2,
            align: TextAlign.center,
          ),
          AppDim.heightMedium,
          DefaultButton(
            buttonHeight: 50,
            btnName: status.retryBtnLabel!,
            onPressed: () => context.read<BluetoothViewModel2>().onPressedError(status)
          )
        ],
      ),
    );
  }
}
