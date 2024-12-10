import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/data/preference/prefs.dart';
import '../../common/utils/my_logger.dart';
import '../domain/usecase/auth_usecase.dart';
import '../entity/login_dto.dart';

/// 사용자 인증 및 권한 관리 클래스
class Authorization {
  late String userID; // ex) U00000
  late String password; // 비밀번호
  late String token; // ex) eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJV
  late String name; // ex) 홍길동
  late bool toggleGatt = false;

  /// 싱글톤 인스턴스
  static final Authorization _authInstance = Authorization._internal();

  /// Authorization 클래스의 단일 인스턴스 제공
  factory Authorization() {
    return _authInstance;
  }

  /// 비공개 생성자
  Authorization._internal() {
    init();
  }

  /// 권한 초기화
  void init() {
    userID = '';
    password = '';
    token = '';
    toggleGatt = false;
  }

  /// SharedPreferences 초기화 데이터 삭제
  Future<void> clearSetStringData() async {
    var pref = await SharedPreferences.getInstance();
    pref.clear();
  }

  /// 권한 초기화
  void clean() {
    init();
    clearSetStringData();
  }

  /// 사용자 정보 설정
  void setValues({
    required String userID,
    required String password,
    required String token,
  }) {
    this.userID = userID;
    this.password = password;
    this.token = token;
  }

  /// 사용자 정보를 초기화하고 필요 시 로그인 수행
  Future<void> initAuthorization() async {
    logger.i('Initializing Authorization');

    final storedUserID = Prefs.userID.get();
    final storedPassword = Prefs.password.get();
    final storedToken = Prefs.token.get();
    final storedToggleGatt = Prefs.toggelGatt.get();

    setValues(
      userID: storedUserID,
      password: storedPassword,
      token: storedToken,
    );
    toggleGatt = storedToggleGatt;

    // 로그인 필요 시 수행
    if (userID.isNotEmpty) {
      await login();
    }
  }

  /// 로그인 수행
  Future<void> login() async {
    try {
      LoginDTO? response = await LoginUseCase().execute({
        'userID': userID,
        'password': password,
      });
      if (response?.status.code == '200' && response != null) {
        token = response.data!;
        Prefs.token.set(response.data!);
        logger.d('로그인 성공: $userID');
      } else {
        _handleLoginFailure();
      }
    } on DioException catch (e) {
      logger.e('DioException during login: $e');
      _handleLoginFailure();
    } catch (e) {
      logger.e('Exception during login: $e');
      _handleLoginFailure();
    }
  }

  /// 로그인 실패 처리
  void _handleLoginFailure() {
    userID = '-';
    password = '';
    token = '';
  }

  @override
  String toString() {
    return 'Authorization{userID: $userID, password: $password, token: $token}';
  }
}
