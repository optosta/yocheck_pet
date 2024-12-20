import 'package:flutter/material.dart';

import '../../../layers/presentation/widgets/w_custom_dialog.dart';
import '../../common.dart';

/// 회원가입 유효성 확인 클래스
class SignValidate{

  /// 아이디(이메일) 체크
  static bool checkID(String value, BuildContext context){
    if(value.isEmpty) {
      validateDialog(context, 'enterIdMsg'.tr());
      return false;
    }
    else if(value.length < 6){
      validateDialog(context, 'idMinLengthMsg'.tr());
      return false;
    } else {
      return true;
    }
  }


  /// 비밀번호 체크
  static bool checkPassword(String value, BuildContext context){
    if(value.isEmpty){
      validateDialog(context, 'enterPassMsg'.tr());
      return false;
    }
    else {
      //String pattern = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\\W).{7,15}";
      String pattern = Texts.passwordRegExp;
      RegExp regExp = RegExp(pattern);

      if(!regExp.hasMatch(value)){
        validateDialog(context, 'passValidationMsg'.tr());
        return false;
      }
      else{
        return true;
      }
    }
  }


  /// 비밀번호2 체크
  static bool checkPassword2(String value, BuildContext context){
    if(value.isEmpty){
      validateDialog(context, 'reenterPassMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }


  /// 비밀번호 일치 체크
  static bool checkSamePassword(String value, String value2, BuildContext context){
    if(value != value2){
      validateDialog(context, 'passMismatchMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }

  /// 이전 비밀번호 일치 체크
  static bool checkSameBeforePassword(String value, String value2, BuildContext context){
    if(value != value2){
      validateDialog(context, 'currentPassMismatchMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }


  /// 성별 체크
  static bool checkGender(String? value, BuildContext context){
    if(value == null){

      validateDialog(context, '성별을 선택해주세요.');
      return false;
    }
    else {
      return true;
    }
  }


  ///  닉네임 체크
  static bool checkNickName(String value, BuildContext context){
    if(value.isEmpty){
      validateDialog(context, 'enterNickNameMsg'.tr());
      return false;
    }
    else if(value.length >=7){
      validateDialog(context, 'nicknameMinLengthMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }


  /// 생년월일 체크
  static bool checkDateOfBirth(String? value, BuildContext context){
    if(value == null){
      validateDialog(context, '생년월일을 입력해주세요.');
      return false;
    }
    else {
      return true;
    }
  }


  ///  이용약관 체크
  static bool checkTerms(bool value, BuildContext context){
    if(value){
      context.showSnackbar('allTermsAgreementMsg'.tr());
      return false;
    }
    else {
      return true;
    }
  }


  /// 회원가입 유효성 확인 Dialog
  static validateDialog(BuildContext context, String message){
    CustomDialog.showMyDialog(
      title: 'signup'.tr(),
      content: message,
      mainContext: context,
    );
  }

}