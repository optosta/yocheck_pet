

import 'package:yocheck_pet/layers/entity/change_pass_dto.dart';
import 'package:yocheck_pet/layers/entity/login_dto.dart';
import 'package:yocheck_pet/layers/entity/logout_dto.dart';

import '../../entity/signup_dto.dart';

abstract interface class AuthRepository {
  Future<LoginDTO?> login(Map<String, dynamic> toMap);
  Future<SignupDTO?> signup(Map<String, dynamic> toMap);
  Future<LogoutDTO?> logout();
  Future<ChangePassDTO?> changePass(Map<String, dynamic> toMap);
}