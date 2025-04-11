import 'package:ecommercexfirebase/presentation/home_screen/home_screen.dart';
import 'package:ecommercexfirebase/presentation/login_screen/login_screen.dart';
import 'package:ecommercexfirebase/presentation/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../presentation/forgot_screen/forgot_screen.dart';
import '../presentation/login_screen/login_cubit.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRouter {
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String signupScreen = "/signup_screen";
  static const String homeScreen = "/home_screen";
  static const String forgotScreen = "/forgot_screen";
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
        return BlocProvider(
          create: (_) => LoginCubit(),
          child: const LoginScreen(),
        );
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
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.forgotScreen,
      name: AppRouter.forgotScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const ForgotScreen();
      },
    ),
  ],
);
