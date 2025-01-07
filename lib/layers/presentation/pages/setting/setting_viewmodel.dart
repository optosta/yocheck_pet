

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../common/utils/nav.dart';
import '../../../../common/utils/snackbar_utils.dart';
import '../../../model/authorization.dart';
import '../../routes/route_path.dart';

class SettingViewModel extends ChangeNotifier {

  /// 로그아웃
  Future<void> logout(context) async {
    Nav.doPop(context); // 로그아웃 다이얼로그 닫기
    _performLogoutSuccess(context);
  }


  /// 로그아웃 성공 처리
  _performLogoutSuccess(context) {
   Authorization().clean();
    SnackBarUtils.showPrimarySnackBar(
      context,
      'logout_success'.tr(),
    );
    context.go(RoutePath.login);
  }
}