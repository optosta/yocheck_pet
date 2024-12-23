import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../widgets/style_text.dart';

class DefaultButton extends StatelessWidget {
  final String lable;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.lable,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDim.xLarge),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppConstants.lightRadius)),
        ),
        child: StyleText(
          text: lable,
          color: textColor,
          size: AppDim.fontSizeMedium,
          fontWeight: AppDim.weight400,
        ),
      ),
    );
  }
}
