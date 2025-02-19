import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/entity/user_name_dto.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../../common/utils/my_logger.dart';
import '../../../domain/usecase/urine/app_version_usecase.dart';
import '../../../domain/usecase/urine/user_name_usecase.dart';
import '../../widgets/w_custom_dialog.dart';

class HomeViewModel extends ChangeNotifier {
  BuildContext context;

  HomeViewModel(this.context) {
    getUserName();
    //fectchAppVersion();
  }

  /// 유저 이름
  String userName = '';

  /// 유저 이름 가져오기
  Future<void> getUserName() async {
    try {
      UserNameDTO? response = await UserNameUesCase().execute();
      if (response?.status.code == Texts.successCode &&
          response?.name != null) {
        userName = response!.name;
        Authorization().name = userName;

        logger.d(Authorization().name);
      }
      notifyListeners();
    } catch (e) {
      logger.e('=> user name: ${e.toString()}');
    }
  }

  /// 최신 버전 정보 가져오기
  Future<void> fectchAppVersion() async {
    const iosPlatform = MethodChannel('com.wonpl.urine/appstore');
    const androidPlatform = MethodChannel('com.wonpl.urine/playstore');

    try {
      final response = await GetAppVersionUseCase().execute();
      if (Texts.appVersion != response) {
        if(context.mounted){
          CustomDialog.showVersionDialog(
            title: '업데이트가 필요합니다!',
            text: '월할한 서비스 이용을 위해 최신\n버전으로 업데이트 필요합니다.',
            mainContext: context,
            onPressed: () async {
              if (Platform.isAndroid) {
                await androidPlatform.invokeMethod('redirectToPlayStore');
              } else {
                await iosPlatform.invokeMethod('openAppStore');
              }
            },
          );
        }

      }
    } catch (error) {
      logger.e(error);
    }
  }
}
