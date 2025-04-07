import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:after_layout/after_layout.dart';

import 'common/common.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'common/di/di.dart';
import 'layers/model/authorization.dart';
import 'layers/presentation/routes/routes.dart';

/// 1차 기능 구현(1월 5일 ~ 1월 31일)
/// 1. 앱 자동업데이트 공지 기능(버전관리) - 다음 출시 이후 적용예정
/// 2. 인체용, 동물용 플랫폼 분리 검토(userType[H, P]) 로그인, 회원가입
/// 2-1. 각 api들 마다 userType이 들어갈수 있도록 수정해야됨
/// 3. 옵토스타용 footer 만들기 - 필요없음
/// 4. 홈버튼이나 기능버튼으로 바로 이동하는 기능 - 완료(결과화면, 관련질환 화면)
/// 5. 앱에서 검사지 또는 검사기 구매 하는 기능 - 필요없음
/// 6. 검사 내역 삭제 기능
Future<void> main() async {
  /// 플랫폼 채널의 위젯 바인딩을 보장해야한다.
  final bindings = WidgetsFlutterBinding.ensureInitialized();

  /// Flutter 초기화가 완료될 때까지 스플래시 화면을 표시합니다.
  FlutterNativeSplash.preserve(widgetsBinding: bindings);

  /// EasyLocalization 패키지를 초기화하여 로컬라이제이션을 지원합니다.
  await EasyLocalization.ensureInitialized();

  ///SharedPreferences 초기화
  await AppPreferences.init();

  /// Locator 초기화
  initLocator();

  /// 사용자 정보 초기화
  await Authorization().initAuthorization();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'), // 영어
        Locale('ko'), // 한국어
        Locale('vi'), // 베트남어
        Locale('nl'), // 네덜란드어
        Locale('ur'), // 파키스탄어 (우르두어)
        Locale('zh', 'HK'), // 중국어(홍콩 번체)
        Locale('zh', 'TW'), // 중국어(대만어)
      ],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: false,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with AfterLayoutMixin {
  final themeData = ThemeData();

  @override
  Widget build(BuildContext context) {
    // 앱 화면 세로 방향 고정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MaterialApp.router(
      title: 'Yocheck Pet',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: themeData.colorScheme.copyWith(primary: AppColors.primaryColor),
      ),
      routerConfig: router,
    );
  }

  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    FlutterNativeSplash.remove();
  }
}

