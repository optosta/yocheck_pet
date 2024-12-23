import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../routes/route_path.dart';
import '../../../../widgets/style_text.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.push(RoutePath.signup),
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
