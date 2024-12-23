

import 'package:flutter/material.dart';

import 'component/terms_dialog.dart';

class TermsCheckProvider extends ChangeNotifier {
  /// 개인정보 약관 accpet
  bool _isCheckedInfo = false;

  /// 서비스 이용 약관 accpet
  bool _isCheckedService = false;

  /// 이용약관 모두 동의가 되어있는지? true: 회원가입 버튼 생성
  bool _isAllChecked = false;

  bool get isCheckedInfo => _isCheckedInfo;

  bool get isCheckedService => _isCheckedService;

  bool get isAllChecked => _isAllChecked;

  set isCheckedInfo(bool? value) {
    _isCheckedInfo = value ?? false;
    _isAllChecked = _isCheckedInfo && _isCheckedService;
    notifyListeners();
  }

  set isCheckedService(bool? value) {
    _isCheckedService = value ?? false;
    _isAllChecked = _isCheckedInfo && _isCheckedService;
    notifyListeners();
  }
}