import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../widgets/style_text.dart';

class LoginButton extends StatelessWidget {

  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDim.large),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppConstants.mediumRadius)
          ),
        ),
        child: StyleText(
          text: 'login'.tr(),
          color: AppColors.whiteTextColor,
          size: AppDim.fontSizeMedium,
          fontWeight: AppDim.weightBold,
        ),
      ),
    );
  }
}
