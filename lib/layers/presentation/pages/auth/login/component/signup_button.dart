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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDim.xLarge),
      child: TextButton(
        onPressed: ()=> context.push(RoutePath.signup),
        style: TextButton.styleFrom(
          backgroundColor: AppColors.signupButtonBg,
          minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(AppConstants.lightRadius)),
        ),
        child: StyleText(
          text: 'signup'.tr(),
          color: AppColors.primaryColor,
          size: AppDim.fontSizeMedium,
          fontWeight: AppDim.weight400,
        ),
      ),
    );
  }
}
