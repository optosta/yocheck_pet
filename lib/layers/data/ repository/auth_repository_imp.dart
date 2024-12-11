import 'package:yocheck_pet/common/constant/api_urls.dart';
import 'package:yocheck_pet/common/utils/dio/dio_manager.dart';
import 'package:yocheck_pet/layers/entity/change_pass_dto.dart';
import 'package:yocheck_pet/layers/entity/login_dto.dart';
import 'package:yocheck_pet/layers/entity/logout_dto.dart';

import '../../../common/utils/my_logger.dart';
import '../../domain/repository/auth_repository.dart';
import '../../entity/signup_dto.dart';

class AuthRepositoryImp implements AuthRepository {

  /// 로그인
  @override
  Future<LoginDTO?> login(Map<String, dynamic> toMap) async {
    try {
      final response = await DioManager()
              .publicDio
              .post(loginApiUrl, data: toMap);

      logger.d(response.data);
      if (response.statusCode == 200) {
        final defaultDTO = LoginDTO.fromJson(response.data);
        return defaultDTO;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  /// 회원가입
  @override
  Future<SignupDTO?> signup(Map<String, dynamic> toMap) async {
    try {
      final response =
      await DioManager()
          .publicDio
          .post(signupApiUrl, data: toMap);

      logger.i(response);
      if (response.statusCode == 200) {
        final signupDTO = SignupDTO.fromJson(response.data);
        return signupDTO;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  /// 로그아웃
  @override
  Future<LogoutDTO?> logout() async {
    try {
      final response = await DioManager()
          .privateDio
          .post(logoutApiUrl);

      logger.i(response);
      if (response.statusCode == 200) {
        return LogoutDTO.fromJson(response.data);
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  /// 비밀번호 변경
  @override
  Future<ChangePassDTO?> changePass(Map<String, dynamic> toMap) async {
    logger.d(toMap);
    try {
      final response = await DioManager()
          .privateDio
          .post(changePassApiUrl, data: toMap);

      logger.i(response);
      if (response.statusCode == 200) {
        return ChangePassDTO.fromJson(response.data);
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }
}
