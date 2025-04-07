import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/password/vm_change_password.dart';

import '../../../../model/enum/signup_type.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/style_text.dart';
import '../../../widgets/ui_helper.dart';
import '../../../widgets/w_dotted_line.dart';
import '../../auth/signup/component/signup_row_form.dart';
import '../../auth/signup/component/signup_textfield.dart';
import 'component/change_pass_button.dart';

enum PasswordChageType {
  beforpass,
  newpass,
  newpass2
}

extension PasswordChageTypeEx on PasswordChageType {
  String get title {
    switch(this){
      case PasswordChageType.beforpass:
        return 'title_beforpass'.tr();
      case PasswordChageType.newpass:
        return 'title_newpass'.tr();
      case PasswordChageType.newpass2:
        return 'title_newpass2'.tr();
    }
  }

  String get hint {
    switch(this){
      case PasswordChageType.beforpass:
        return 'hint_beforpass'.tr();
      case PasswordChageType.newpass:
        return 'passhintMsg'.tr();
      case PasswordChageType.newpass2:
        return 'passhintMsg'.tr();
    }
  }
}


class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) => ChangePasswordViewModel(),
      child: Consumer<ChangePasswordViewModel>(
        builder: (context, provider, child) {
          return  FrameScaffold(
              appBarTitle: 'title_chagnepass'.tr(),
              isKeyboardHide: true,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDim.medium),
                  child: Column(
                      children:
                      [
                        const Gap(AppDim.xLarge),

                        SignupRowForm(
                          title: PasswordChageType.beforpass.title,
                          child: SignupTextField(
                            type: SignupType.pass,
                            controller: provider.beforePassController,
                            hint: PasswordChageType.beforpass.hint,
                          ),
                        ),

                        const DottedLine(mWidth: double.infinity),

                        /// 비밀번호 입력
                        SignupRowForm(
                          title: PasswordChageType.newpass.title,
                          child: SignupTextField(
                            type: SignupType.pass,
                            controller: provider.newPassController,
                            hint: PasswordChageType.newpass.hint,
                          ),
                        ),
                        SignupRowForm(
                          title: PasswordChageType.newpass2.title,
                          child: SignupTextField(
                            type: SignupType.pass,
                            controller: provider.newPass2Controller,
                            hint: PasswordChageType.newpass.hint,
                           ),
                        ),
                        const DottedLine(mWidth: double.infinity),

                        const Gap(AppDim.xXLarge),

                        /// 비밀번호 변경 버튼
                        ChangePasswordButton(
                          onPressed: () => provider.changePassword(context),
                        ),
                        const Gap(AppDim.xXLarge),

                      ]
                  ),
                ),
              )
          );
        },
      ),
    );
  }

  void _showErrorDialog(BuildContext context, String message) {
    UiHelper.defaultDialog(context, 'title_chagnepass'.tr(), message);
  }

}
