import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/constant/app_colors.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';
import 'package:yocheck_pet/layers/presentation/auth/signup/v_signup.dart';
import 'package:yocheck_pet/layers/presentation/widget/style_text.dart';

class SignUpGuideButton extends StatelessWidget {
  const SignUpGuideButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        StyleText(
          text: 'no_account'.tr(),
          color: AppColors.greyTextColor,
          size: AppDim.fontSizeMedium,
        ),
        TextButton(
          onPressed: () => Nav.doPush(context, const SignupView()),
          child: StyleText(
              text: 'signup'.tr(),
              color: AppColors.greyTextColor,
              size: AppDim.fontSizeMedium,
              fontWeight: AppDim.weightBold,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.greyTextColor,
              decorationThickness: 0.8),
        )
      ],
    );
  }
}
