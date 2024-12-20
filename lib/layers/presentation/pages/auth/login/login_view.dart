import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/snackbar_utils.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/login/login_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/login/component/login_button.dart';
import 'package:yocheck_pet/layers/presentation/widgets/ui_helper.dart';

import '../../../../../common/utils/app_keyboard_util.dart';
import '../../../routes/route_path.dart';
import '../../../widgets/style_text.dart';
import 'component/login_textfield.dart';
import 'component/signup_guide_button.dart';

enum LoginInputType { id, password }

/// 로그인 화면
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String get licenseText => '©2024 OPTOSTA, Inc. All rights reserved.';

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
        child: Scaffold(
          body: Consumer<LoginViewModel>(
            builder: (context, provider, child) {
              return GestureDetector(
                  onTap: () => AppKeyboardUtil.hide(context),
                  child: SafeArea(
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () => AppKeyboardUtil.hide(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              /// 메인 BI 이미지
                              buildBiImage(),
                              const Gap(AppDim.xLarge),

                              /// 아이디 입력란
                              LoginTextField(
                                type: LoginInputType.id,
                                controller: idController,
                              ),
                              const Gap(AppDim.medium),

                              /// 비밀번호 입력란
                              LoginTextField(
                                type: LoginInputType.password,
                                controller: passController,
                              ),
                              const Gap(AppDim.medium),

                              /// 로그인 버튼
                              LoginButton(
                                onPressed: () => {
                                  AppKeyboardUtil.hide(context),
                                  context.read<LoginViewModel>().login(
                                        idController.text,
                                        passController.text,
                                        loginDialog: (message) =>
                                            UiHelper.loginDialog(
                                                context, message),
                                        goToHome: () =>
                                            context.go(RoutePath.home),
                                      )
                                },
                              ),
                              const Gap(AppDim.xLarge),

                              /// 회원가입 안내 버튼
                              const SignUpGuideButton()
                            ],
                          ),
                        ),

                        /// 라이센스 마크
                        licenseMark()
                      ],
                    ),
                  ));
            },
          ),
        ));
  }

  /// 메인 BI 이미지
  buildBiImage() => Image.asset(
        '${Texts.imagePath}/login/logo.png',
        height: 50,
        width: 210,
      );

  /// 라이센스 마크
  Widget licenseMark() => Align(
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

  _authLoginErrorMsg(context) {
    if (Authorization().userID == '-') {
      SnackBarUtils.showPrimarySnackBar(
        context,
        '자동로그인이 수행되지 못했습니다.',
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
