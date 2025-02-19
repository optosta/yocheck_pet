import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/snackbar_utils.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';
import 'package:yocheck_pet/layers/presentation/enums/auth_input_field_type.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/login/component/default_button.dart';
import 'package:yocheck_pet/layers/presentation/widgets/ui_helper.dart';

import '../../../../../common/utils/app_keyboard_util.dart';
import '../../../routes/route_path.dart';
import '../../../widgets/style_text.dart';
import 'component/auth_textfield.dart';

/// 로그인 화면
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String get licenseText => '©2024 CHUNGDO, Inc. All rights reserved.';

  final idController = TextEditingController(); // 아이디 TextEditing
  final passController = TextEditingController(); // 비밀번호 TextEditing

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _authLoginErrorMsg(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      builder: (context, child) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        /// 메인 BI 이미지
                        _buildBiImage(),
                        const Gap(AppDim.xLarge),

                        /// 아이디 입력란
                        AuthTextField(
                          type: AuthInputFieldType.id,
                          controller: idController,
                        ),

                        /// 비밀번호 입력란
                        AuthTextField(
                          type: AuthInputFieldType.password,
                          controller: passController,
                        ),

                        /// 로그인 버튼
                        DefaultButton(
                          onPressed: () => {
                          FocusScope.of(context).unfocus(),
                            context.read<LoginViewModel>().login(
                                  idController.text.trim(),
                                  passController.text.trim(),
                                  loginDialog: (message) => UiHelper.defaultDialog(context, 'login'.tr(), message,),
                                  goToHome: () => context.go(RoutePath.home),
                                )
                          },
                          lable: 'login'.tr(),
                          backgroundColor: AppColors.primaryColor,
                          textColor: AppColors.whiteTextColor,
                        ),
                        AppDim.heightXSmall,

                        /// 회원가입 버튼
                        DefaultButton(
                          onPressed: () => context.push(RoutePath.signup),
                          lable: 'signup'.tr(),
                          backgroundColor: AppColors.signupButtonBg,
                          textColor: AppColors.primaryColor,
                        ),
                      ],
                    ),
                  ),

                  /// 라이센스 마크
                  _buildLicenseMark()
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// 메인 BI 이미지
  _buildBiImage() => Image.asset(
        '${Texts.imagePath}/login/login_logo.png',
        height: 28,
        width: 185,
      );

  /// 라이센스 마크
  _buildLicenseMark() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: const EdgeInsets.only(bottom: AppDim.medium),
          child: StyleText(
            text: licenseText,
            color: AppColors.greyTextColor,
            size: AppDim.fontSizeSmall,
            fontWeight: AppDim.weightBold,
          ),
        ),
      );

  //TODO: en,ko text 변환이 필요함
  _authLoginErrorMsg(context) {
    if (Authorization().userID == '-') {
      SnackBarUtils.showPrimarySnackBar(
        context,
        Texts.autoLoginFailure,
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    passController.dispose();
  }
}
