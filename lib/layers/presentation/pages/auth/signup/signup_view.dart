import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/enums/auth_input_field_type.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/login/component/auth_textfield.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/signup_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/component/terms_use.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/terms_check_provider.dart';
import 'package:yocheck_pet/layers/presentation/widgets/ui_helper.dart';

import '../../../../../common/data/validate/singup_validate.dart';
import '../../../../../common/utils/snackbar_utils.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../login/component/default_button.dart';
import 'component/terms_dialog.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final idController = TextEditingController();
  final passController = TextEditingController();
  final pass2Controller = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    passController.dispose();
    pass2Controller.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignupViewModel()),
        ChangeNotifierProvider(create: (_) => TermsCheckProvider()),
      ],
      builder: (context, child) {
        return FrameScaffold(
          isKeyboardHide: true,
          appBarTitle: 'signup'.tr(),
          bodyPadding: EdgeInsets.zero,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppDim.heightMedium,

                    /// 아이디 입력
                    AuthTextField(
                      type: AuthInputFieldType.id,
                      controller: idController,
                    ),
                    AppDim.heightSmall,

                    /// 비밀번호 입력
                    AuthTextField(
                      type: AuthInputFieldType.password,
                      controller: passController,
                    ),

                    /// 비밀번호 재입력
                    AuthTextField(
                      type: AuthInputFieldType.confirmPassword,
                      controller: pass2Controller,
                    ),
                    AppDim.heightSmall,

                    /// 펫명 입력
                    AuthTextField(
                      type: AuthInputFieldType.name,
                      controller: nameController,
                    ),
                    AppDim.heightLarge,

                    /// 이용약관
                    Consumer<TermsCheckProvider>(
                      builder: (context, provider, child) {
                        return TermsUse(
                          isCheckedInfo: provider.isCheckedInfo,
                          isCheckedService: provider.isCheckedService,
                          onChangedInfo: (value) => provider.isCheckedInfo = value,
                          onChangedService: (value) => provider.isCheckedService = value,
                          showTerms: () => showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return TermsAlertDialog();
                            },
                          )
                        );
                      },
                    ),
                  ],
                ),
                const Gap(AppDim.xXLarge),

                /// 회원가입 버튼
                Selector<TermsCheckProvider, bool>(
                  selector: (_, provider) => provider.isAllChecked == true,
                  builder: (_, value, Widget? child) {
                    return Visibility(
                      visible: value,
                      child: DefaultButton(
                        onPressed: () => _handleSignup(context),
                        lable: 'signup'.tr(),
                        backgroundColor: AppColors.primaryColor,
                        textColor: AppColors.whiteTextColor,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleSignup(BuildContext context) {
    // 유효성 검사 함수
    bool isValid = SignValidate.validationSignup(
      idController.text,
      passController.text,
      pass2Controller.text,
      nameController.text,
      (message) => _showErrorDialog(context, message),
    );

    if (isValid) return;

    // 회원가입 처리 로직
    context.read<SignupViewModel>().signup(
      toMap: {
        'userID': idController.text,
        'password': passController.text,
        'name': nameController.text,
      },
      showErrorDialog: (String message) => _showErrorDialog(context, message),
      successSignup: () => _onSignupSuccess(context),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    UiHelper.defaultDialog(context, 'signup'.tr(), message);
  }

  void _onSignupSuccess(BuildContext context) {
    context.pop(); // 회원가입 화면 pop
    SnackBarUtils.showPrimarySnackBar(context, 'signup_success'.tr());
  }
}
