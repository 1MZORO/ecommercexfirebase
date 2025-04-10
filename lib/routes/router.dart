import 'package:ecommercexfirebase/presentation/home_screen/home_screen.dart';
import 'package:ecommercexfirebase/presentation/login_screen/login_screen.dart';
import 'package:ecommercexfirebase/presentation/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRouter {
  static const String splashScreen = "/splash_screen";
  static const String homeScreen = "/home_screen";
  static const String loginScreen = "/login_screen";
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
        path: AppRouter.loginScreen,
        name: AppRouter.loginScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const LoginScreen();
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
