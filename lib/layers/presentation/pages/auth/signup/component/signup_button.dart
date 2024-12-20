import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../widgets/style_text.dart';

class SignUpButton extends StatelessWidget {

  final VoidCallback onPressed;

  const SignUpButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
        shape: RoundedRectangleBorder(
            borderRadius: AppConstants.borderLightRadius,
        ),
      ),
      child: StyleText(
        text: 'signup'.tr(),
        color: AppColors.whiteTextColor,
        size: AppDim.fontSizeMedium,
        fontWeight: AppDim.weightBold,
      ),
    );
  }
}
