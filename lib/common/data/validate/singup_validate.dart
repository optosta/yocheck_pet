import 'dart:ui';

import '../../common.dart';
import '../../utils/my_logger.dart';

/// 회원가입 유효성 확인 클래스
class SignValidate{

  /// 회원가입 유효성 체크
  static bool validationSignup(
      String id,
      String pass,
      String pass2,
      String name,
      Function(String message) showErrorDialog){
    if(SignValidate.checkID(id, (message)=> showErrorDialog(message))&&
        SignValidate.checkPassword(pass, (message)=> showErrorDialog(message))&&
        SignValidate.checkPassword2(pass2, (message)=> showErrorDialog(message))&&
        SignValidate.checkSamePassword(pass, pass2, ()=> showErrorDialog('passMismatchMsg'.tr()))&&
        SignValidate.checkNickName(name, (message)=> showErrorDialog(message))){
      return false; // 위 체크 내용이 true 경우
    }
    else {
      return true; // 위 체크 내용이 false 경우
    }
  }


  /// 아이디(이메일) 체크
  static bool checkID(String value, Function(String message) checkMsg){
    if(value.isEmpty) {
      checkMsg('enterIdMsg'.tr());
      return false;
    }
    else if(value.length < 6){
      checkMsg('idMinLengthMsg'.tr());
      return false;
    } else {
      return true;
    }
  }

  /// 비밀번호 체크
  static bool checkPassword(String value, Function(String message) checkMsg){
    if(value.isEmpty){
      checkMsg('enterPassMsg'.tr());
      return false;
    }
    else {
      String pattern = Texts.passwordRegExp;
      RegExp regExp = RegExp(pattern);

      if(!regExp.hasMatch(value)){
        checkMsg('passValidationMsg'.tr());
        return false;
      }
      else{
        return true;
      }
    }
  }

  /// 비밀번호2 체크
  static bool checkPassword2(String value, Function(String message) checkMsg){
    if(value.isEmpty){
      checkMsg('reenterPassMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }


  /// 비밀번호 일치 체크
  /// 'passMismatchMsg'.tr()
  static bool checkSamePassword(String value, String value2, VoidCallback checkMsg){
    if(value != value2){
      checkMsg;
      logger.d('value:$value / value2:$value2');
      return false;
    }
    else {
      logger.d('value:$value / value2:$value2');
      return true;
    }
  }

  /// 이전 비밀번호 일치 체크
  /// 'currentPassMismatchMsg'.tr()
  static bool checkSameBeforePassword(String value, String value2, VoidCallback checkMsg){
    if(value != value2){
      checkMsg;
      logger.d('value:$value / value2:$value2');
      return false;
    }
    else {
      logger.d('value:$value / value2:$value2');
      return true;
    }
  }

  ///  닉네임 체크
  static bool checkNickName(String value, Function(String message) checkMsg){
    if(value.isEmpty){
      checkMsg('enterNickNameMsg'.tr());
      return false;
    }
    else if(value.length >= 7){
      checkMsg( 'nicknameMinLengthMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }

}