

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/nav.dart';
import '../../../../common/utils/snackbar_utils.dart';
import '../../../model/authorization.dart';
import '../auth/login/login_view.dart';

class SettingViewModel extends ChangeNotifier {

  /// 로그아웃
  Future<void> logout(context) async {
    Nav.doPop(context); // 로그아웃 다이얼로그 닫기
    _performLogoutSuccess(context);
    // try {
    //   LogoutDTO? response = await LogoutUseCase().execute();
    //
    //   if (response != null && response.status.code == '200') {
    //     _performLogoutSuccess(context);
    //   } else {
    //     _performLogoutFailure(context, '서버가 불안정합니다. 다시 시도 바랍니다.');
    //     logger.e('=> 로그아웃 실패:${response?.status.code}/  ${response?.status.message}');
    //   }
    // } on DioException catch (dioError) {
    //   _performLogoutFailure(context, '서버가 불안정합니다. 다시 시도 바랍니다.');
    //   logger.e('=> 로그아웃 실패: ${dioError.message}');
    // } catch (error) {
    //   _performLogoutFailure(context, '알 수 없는 오류가 발생했습니다.');
    //   logger.e('=> 로그아웃 실패:$error');
    // }
  }


  /// 로그아웃 성공 처리
  _performLogoutSuccess(context) {
   Authorization().clean();
    SnackBarUtils.showPrimarySnackBar(
      context,
      'logout_success'.tr(),
    );
    Nav.doAndRemoveUntil(context, const LoginView());
  }

}