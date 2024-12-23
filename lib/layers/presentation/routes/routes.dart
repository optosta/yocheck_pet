import 'package:go_router/go_router.dart';
import 'package:yocheck_pet/layers/presentation/pages/auth/signup/signup_view.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/disease/disease_info_view.dart';
import 'package:yocheck_pet/layers/presentation/pages/result/result_view.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/setting_view.dart';

import '../../model/authorization.dart';
import '../pages/analysis/bluetooth/bluetooth_view.dart';
import '../pages/auth/login/login_view.dart';
import '../pages/home/home_view.dart';
import '../pages/ingredient/ingredient_view.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.login,
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),

    GoRoute(
      path: RoutePath.signup,
      name: 'signup',
      builder: (context, state) => const SignupView(),
    ),

    GoRoute(
      path: RoutePath.home,
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),

    GoRoute(
      path: RoutePath.bluetooth,
      name: 'bluetooth',
      builder: (context, state) => const BluetoothView(),
    ),

    GoRoute(
      path: RoutePath.result,
      name: 'result',
      builder: (context, state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final urineStatus = args['urineStatus'];
        final testDate = args['testDate'];
        return UrineResultView(urineList: urineStatus, testDate: testDate);
      }
    ),

    GoRoute(
      path: RoutePath.diseaseinfo,
      name: 'diseaseinfo',
      builder: (context, state) => const DiseaseInfoView(),
    ),

    GoRoute(
      path: RoutePath.setting,
      name: 'setting',
      builder: (context, state) => const SettingView(),
    ),

    GoRoute(
      path: RoutePath.ingredient,
      name: 'ingredient',
      builder: (context, state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final resultText = args['resultText'];
        final statusList = args['statusList'];
        return IngredientView(resultText: resultText, statusList: statusList);
      }
    ),
  ],
  initialLocation:
      (Authorization().userID.isEmpty || Authorization().userID == '')
          ? RoutePath.login
          : RoutePath.home,
);
