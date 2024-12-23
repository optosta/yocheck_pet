import 'package:easy_localization/easy_localization.dart';

enum AuthInputFieldType { id, password, confirmPassword, name }

extension AuthInputFieldX on AuthInputFieldType {

  String get title {
    switch(this){
      case AuthInputFieldType.id:
        return 'textfield_title_id'.tr();
      case AuthInputFieldType.password:
        return 'textfield_title_password'.tr();
      case AuthInputFieldType.confirmPassword:
        return 'textfield_title_check_password'.tr();
      case AuthInputFieldType.name:
        return 'textfield_title_name'.tr();
    }
  }

  String get hint {
    switch(this){
      case AuthInputFieldType.id:
        return 'id_hint'.tr();
      case AuthInputFieldType.password:
        return 'password_hint'.tr();
      case AuthInputFieldType.confirmPassword:
        return 'check_password_hint'.tr();
      case AuthInputFieldType.name:
        return 'name_hint'.tr();
    }
  }

}