import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/signup_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/component/signup_button.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/component/signup_row_form.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/component/signup_textfield.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/component/terms_use.dart';

import '../../../../model/enum/signup_type.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/w_dotted_line.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SignupViewModel(),
      child: Consumer<SignupViewModel>(
        builder: (context, provider, child) {
          return  FrameScaffold(
            isKeyboardHide: true,
            appBarTitle: 'signup'.tr(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppDim.medium),
                    child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            const Gap(AppDim.large),

                            /// 아이디 입력
                            SignupRowForm(
                              title: 'id'.tr(),
                              child: SignupTextField(
                                type: SignupType.id,
                                controller: provider.idController,
                                hint: 'id_hint'.tr(),
                              ),
                            ),
                            const DottedLine(mWidth: double.infinity),

                            /// 비밀번호 입력
                            SignupRowForm(
                              title: 'password'.tr(),
                              child: SignupTextField(
                                type: SignupType.pass,
                                controller: provider.passController,
                                hint: 'password_hint'.tr(),
                              ),
                            ),

                            /// 비밀번호 재입력
                            SignupRowForm(
                              title: 'password_confirm'.tr(),
                              child: SignupTextField(
                                type: SignupType.pass2,
                                controller: provider.pass2Controller,
                                hint: 're_enter_password'.tr(),
                              ),
                            ),
                            const DottedLine(mWidth: double.infinity),

                            /// 펫명 입력
                            SignupRowForm(
                              title: 'pat_name'.tr(),
                              child: SignupTextField(
                                type: SignupType.nickname,
                                controller: provider.nickNameController,
                                hint: 'pat_hint'.tr(),
                              ),
                            ),

                            const DottedLine(mWidth: double.infinity),
                            const Gap(AppDim.large),

                            /// 이용약관
                            Consumer<SignupViewModel>(
                              builder: (context, provider, child) {
                                return TermsUse(
                                  isCheckedInfo: provider.isCheckedInfo,
                                  isCheckedService: provider.isCheckedService,
                                  onChangedInfo: (value) => provider.isCheckedInfo = value,
                                  onChangedService: (value) => provider.isCheckedService = value,
                                  showTerms: () => provider.showTermsDialog(context),
                                );
                              },
                            ),
                          ],
                        ),
                  ),
                  const Gap(AppDim.xXLarge),


                  /// 회원가입 버튼
                  Visibility(
                    visible: provider.isAllChecked,
                    child: SignUpButton(
                      onPressed: () => provider.signup(context),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
