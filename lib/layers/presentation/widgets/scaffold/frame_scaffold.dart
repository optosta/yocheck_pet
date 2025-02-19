import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../common/utils/app_keyboard_util.dart';
import '../style_text.dart';

class FrameScaffold extends StatelessWidget {
  final String? appBarTitle;
  final Widget body;
  final EdgeInsets bodyPadding;
  final Widget? bottomNavigationBar;
  final Gradient? gradient;
  final Color? backgroundColor;
  final bool isKeyboardHide;
  final bool isActions;

  const FrameScaffold({
    super.key,
    required this.body,
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: AppDim.medium),
    this.appBarTitle,
    this.backgroundColor = AppColors.white,
    this.isKeyboardHide = false,
    this.bottomNavigationBar,
    this.isActions = false,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {if (isKeyboardHide) FocusScope.of(context).unfocus(),},
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0.0,
          title: StyleText(
            text: appBarTitle!,
            size: AppDim.fontSizeLarge,
            color: AppColors.primaryColor,
            fontWeight: AppDim.weightBold,
          ),
          iconTheme: const IconThemeData(color: AppColors.darkGrey),
          centerTitle: true,
        ),
        body: Container(
          padding: bodyPadding,
          decoration: BoxDecoration(
            gradient: gradient,
          ),
          child: body,
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
