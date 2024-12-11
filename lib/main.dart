import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:after_layout/after_layout.dart';

import 'common/common.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'common/di/di.dart';
import 'layers/model/authorization.dart';
import 'layers/presentation/routes/routes.dart';

Future<void> main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized(); // 플랫폼 채널의 위젯 바인딩을 보장해야한다.
  FlutterNativeSplash.preserve(widgetsBinding: bindings); // Flutter 초기화가 완료될 때까지 스플래시 화면을 표시합니다.

  await EasyLocalization.ensureInitialized(); // EasyLocalization 패키지를 초기화하여 로컬라이제이션을 지원합니다.
  await AppPreferences.init(); // SharedPreferences 초기화
  initLocator(); // Locator 초기화
  await Authorization().initAuthorization(); // 사용자 정보 초기화

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
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

