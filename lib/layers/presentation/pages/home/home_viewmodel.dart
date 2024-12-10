
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/entity/user_name_dto.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';

import '../../../../common/utils/my_logger.dart';
import '../../../domain/usecase/urine/user_name_usecase.dart';


class HomeViewModel extends ChangeNotifier {

  HomeViewModel(){
    getUserName();
  }

  /// 유저 이름
  String userName = '-';

  /// 유저 이름 가져오기
  Future<void> getUserName() async {
    try {
      UserNameDTO? response = await UserNameUesCase().execute();
      if(response?.status.code == Texts.successCode && response?.name != null){
        userName = response!.name;
        Authorization().name = userName;

        logger.d(Authorization().userID);
      }
      notifyListeners();
    } catch (e) {
      logger.e('=> user name: ${e.toString()}');
    }
  }
}