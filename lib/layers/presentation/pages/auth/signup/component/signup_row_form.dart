import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/constant/app_dimensions.dart';

import '../../../../widgets/style_text.dart';

class SignupRowForm extends StatelessWidget {

  final String title;
  final Widget child;

  const SignupRowForm({super.key, required this.title, required this.child,});

  double get rowFormItemHeight => 80;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: rowFormItemHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          /// 타이틀
          Expanded(
            flex: 3,
            child: StyleText(
              text: title,
              fontWeight: AppDim.weightBold,
              size: AppDim.fontSizeSmall,
              maxLinesCount: 2,
            ),
          ),

          Expanded(
            flex: 7,
            child: child,
          )
        ],
      ),
    );
  }
}
