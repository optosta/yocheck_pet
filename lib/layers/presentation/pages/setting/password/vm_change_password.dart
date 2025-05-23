
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yocheck_pet/layers/entity/change_pass_dto.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../../../common/data/validate/singup_validate.dart';
import '../../../../../common/utils/dio/dio_exceptions.dart';
import '../../../../../common/utils/my_logger.dart';
import '../../../../../common/utils/nav.dart';
import '../../../../../common/utils/snackbar_utils.dart';
import '../../../../domain/usecase/auth_usecase.dart';
import '../../../widgets/w_custom_dialog.dart';
import '../../auth/login/login_view.dart';

class ChangePasswordViewModel extends ChangeNotifier {
  /// 현재 비밀번호
  final _beforePassController = TextEditingController();

  /// 새 비밀번호
  final _newPassController = TextEditingController();

  /// 새 비밀번호 확인
  final _newPass2Controller = TextEditingController();

  TextEditingController get beforePassController => _beforePassController;
  TextEditingController get newPassController => _newPassController;
  TextEditingController get newPass2Controller => _newPass2Controller;


  /// 비밀번호 변경
  Future<void> changePassword(context) async {
    if (!validationChangePass(context)) {
      return;
    }

    try {
      ChangePassDTO? response = await ChangePassUseCase().execute(toMap());
        if (response?.status.code == '200' && response != null) {
          Nav.doAndRemoveUntil(context, const LoginView());
          SnackBarUtils.showPrimarySnackBar(context, '비밀번호가 변경되었습니다.');
        } else {
          changePassDialog(context, '비밀번호 변경이 정상적으로\n처리되지 않았습니다.');
        }
    } on DioException catch (e) {
      final msg = DioExceptions.fromDioError(e).toString();
      changePassDialog(context, msg);
    } catch (e) {
      logger.e(e);
      changePassDialog(context, '죄송합니다.\n예기치 않은 문제가 발생했습니다.');
    }
  }

  /// 비밀번호 유효성 체크
  bool validationChangePass(BuildContext context) {
    if (_beforePassController.text.isEmpty ||
        _newPass2Controller.text.isEmpty ||
        _newPassController.text.isEmpty) {
      changePassDialog(context, 'hint_beforpass'.tr());
      return true;
    }

    if (SignValidate.checkSameBeforePassword(
            _beforePassController.text,
            Authorization().password,
            changePassDialog(context, 'currentPassMismatchMsg'.tr())
    ) ||
        SignValidate.checkSamePassword(
            _newPassController.text,
            _newPass2Controller.text,
            changePassDialog(context, 'passMismatchMsg'.tr()))) {
      return false; // 위 체크 내용이 true 경우
    } else {
      logger.i('유효성 체크 완료');
      return true; // 위 체크 내용이 false 경우}
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'userID'    : Authorization().userID,
      'password'  : _beforePassController.text,
      'npassword' : _newPassController.text,
      'userType'  : 'P',
    };
  }


  /// 비밀번호 변경 다이얼로그
  changePassDialog(BuildContext context, String message){
   return CustomDialog.showMyDialog(
      title: '비밀번호 변경',
      content: message,
      mainContext: context,
    );
  }
}
