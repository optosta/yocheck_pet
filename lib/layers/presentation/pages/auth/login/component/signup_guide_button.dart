import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../widgets/style_text.dart';
import '../../signup/signup_view.dart';

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
              decorationThickness: 0.8,
          ),
        )
      ],
    );
  }
}
