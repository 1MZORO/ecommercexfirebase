import 'package:ecommercexfirebase/presentation/home_screen/home_screen.dart';
import 'package:ecommercexfirebase/presentation/login_screen/login_one_screen.dart';
import 'package:ecommercexfirebase/presentation/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../presentation/login_screen/login_cubit.dart';
import '../presentation/login_screen/login_two_screen.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRouter {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String loginOneScreen = "/login_one_screen";
  static const String loginTwoScreen = "/login_two_screen";
  static const String signupScreen = "/signup_screen";
}

final GoRouter router = GoRouter(
  initialLocation: AppRouter.splashScreen,
  navigatorKey: navigatorKey,
  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.splashScreen,
      name: AppRouter.splashScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.homeScreen,
      name: AppRouter.homeScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.loginOneScreen,
      name: AppRouter.loginOneScreen,
      builder: (BuildContext context, GoRouterState state) {
        return BlocProvider(
          create: (_) => LoginCubit(),
          child: const LoginOneScreen(),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.loginTwoScreen,
      name: AppRouter.loginTwoScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const LoginTwoScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.signupScreen,
      name: AppRouter.signupScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const SignupScreen();
      },
    ),
  ],
);
