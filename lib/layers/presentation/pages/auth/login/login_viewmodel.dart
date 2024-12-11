import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../../../common/data/preference/prefs.dart';
import '../../../../../common/utils/dio/dio_exceptions.dart';
import '../../../../../common/utils/my_logger.dart';
import '../../../../domain/usecase/auth_usecase.dart';
import '../../../../entity/login_dto.dart';

class LoginViewModel extends ChangeNotifier {

  /// 로그인
  Future login(
    String? id,
    String? pass, {
    required Function(String message) loginDialog,
    required VoidCallback goToHome,
  }) async {
    if (id == null || pass == null) {
      loginDialog('empty_field'.tr());
      return;
    }
    try {
      LoginDTO? resonse =
          await LoginUseCase().execute({'userID': id, 'password': pass});
      if (resonse?.status.code == Texts.successCode && resonse != null) {
        Authorization().setValues(
          userID: id,
          password: pass,
          token: resonse.data ?? '',
        );

        saveAuthPrefs(id, pass, resonse.data ?? '');
        goToHome();
      } else {
        loginDialog('login_error'.tr());
      }
    } on DioException catch (e) {
      final msg = DioExceptions.fromDioError(e).toString();
      loginDialog(msg);
    } catch (e) {
      logger.e(e);
      loginDialog(Texts.unexpectedError);
    }
  }

  /// 자동로그인을 위한 데이터 저장
  saveAuthPrefs(String id, String pass, String token) {
    Prefs.userID.set(id);
    Prefs.password.set(pass);
    Prefs.token.set(token);
  }
}
