import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/utils/scale_font_size.dart';
import 'package:yocheck_pet/layers/presentation/enums/auth_input_field_type.dart';

import '../../../../../../common/common.dart';
import '../../../../widgets/style_text.dart';

class AuthTextField extends StatelessWidget {
  final AuthInputFieldType type;
  final TextEditingController controller;

  const AuthTextField({
    super.key,
    required this.type,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppDim.xLarge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 타이틀
          StyleText(
            text: type.title,
            color: AppColors.primaryColor,
            fontWeight: AppDim.weight600,
          ),
          AppDim.heightSmall,

          /// 입력 필드
          Container(
              height: AppConstants.textFieldHeight,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(AppConstants.lightRadius),
                border: Border.all(
                  color: Colors.grey.shade300,
                  width: AppConstants.borderLightWidth,
                ),
              ),
              child: MediaQuery(
                data: getScaleFontSize(context),
                child: TextField(
                  autofocus: false,
                  obscureText: (type == AuthInputFieldType.password ||
                          type == AuthInputFieldType.confirmPassword)
                      ? true
                      : false,
                  controller: controller,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                    fontSize: AppDim.fontSizeSmall,
                    color: Colors.black,
                    decorationThickness: 0,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                      left: AppDim.small,
                      bottom: AppDim.small,
                    ),
                    hintText: type.hint,
                    hintStyle: const TextStyle(
                      fontSize: AppDim.fontSizeSmall,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )),
          AppDim.heightMedium,
        ],
      ),
    );
  }
}
