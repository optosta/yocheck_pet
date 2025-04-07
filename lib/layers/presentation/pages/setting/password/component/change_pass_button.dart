
import 'package:flutter/material.dart';

import '../../../../../../common/common.dart';
import '../../../../widgets/style_text.dart';

class ChangePasswordButton extends StatelessWidget {

  final VoidCallback onPressed;

  const ChangePasswordButton({
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
        text: 'title_chagnepass'.tr(),
        color: AppColors.whiteTextColor,
        size: AppDim.fontSizeMedium,
        fontWeight: AppDim.weightBold,
      ),
    );
  }
}
