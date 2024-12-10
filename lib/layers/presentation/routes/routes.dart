import 'package:go_router/go_router.dart';

import '../../model/authorization.dart';
import '../pages/auth/login/v_login.dart';
import '../pages/home/home_view.dart';
import '../pages/ingredient/v_ingredient_result.dart';
import 'route_path.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePath.login,
      name: 'login',
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: RoutePath.home,
      name: 'home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: RoutePath.ingredient,
      name: 'ingredient',
      builder: (context, state) {
        final Map<String, dynamic> args = state.extra as Map<String, dynamic>;
        final resultText = args['resultText'];
        final statusList = args['statusList'];
        return IngredientResultView(resultText: resultText, statusList: statusList);
      }
    ),
  ],
  initialLocation:
      (Authorization().userID.isEmpty || Authorization().userID == '-')
          ? RoutePath.login
          : RoutePath.home,
);
