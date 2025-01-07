

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/dart/extension/datetime_extension.dart';
import 'package:yocheck_pet/layers/domain/usecase/auth_usecase.dart';

import '../../../../../common/data/validate/singup_validate.dart';
import '../../../../../common/utils/dio/dio_exceptions.dart';
import '../../../../../common/utils/my_logger.dart';
import '../../../../../common/utils/snackbar_utils.dart';
import '../../../../entity/signup_dto.dart';
import '../../../widgets/bottomsheet/datepicker_bottom_sheet.dart';
import '../../../widgets/w_custom_dialog.dart';
import 'component/terms_dialog.dart';

class SignupViewModel extends ChangeNotifier {
  /// 회원가입
  Future<void> signup({
    required Map<String, dynamic> toMap,
    required Function(String message) showErrorDialog,
    required VoidCallback successSignup,
  }) async {
    try {
      SignupDTO? response = await SignupUseCase().execute(toMap);
        if (response?.status.code == '200' && response != null) {
          successSignup();
        } else if (response!.status.code == Texts.duplicationCode) {
          showErrorDialog('duplicateIdMsg'.tr());
        } else {
          showErrorDialog('signupFailed'.tr());
        }
    } on DioException catch (e) {
      final msg = DioExceptions.fromDioError(e).toString();
      showErrorDialog(msg);
    } catch (e) {
      logger.e(e);
      showErrorDialog('unexpected_error'.tr());
    }
  }
}