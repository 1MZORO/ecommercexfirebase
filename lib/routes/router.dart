import 'package:ecommercexfirebase/presentation/account_screen/account_screen.dart';
import 'package:ecommercexfirebase/presentation/add_product_screen/add_product_screen.dart';
import 'package:ecommercexfirebase/presentation/cart_screen/cart_screen.dart';
import 'package:ecommercexfirebase/presentation/details_screen/details_screen.dart';
import 'package:ecommercexfirebase/presentation/forgot_screen/forgot_cubit.dart';
import 'package:ecommercexfirebase/presentation/forgot_screen/forgot_success_screen.dart';
import 'package:ecommercexfirebase/presentation/order_screen/order_screen.dart';
import 'package:ecommercexfirebase/presentation/otp_verified_screen/otp_verified_screen.dart';
import 'package:ecommercexfirebase/presentation/home_screen/home_screen.dart';
import 'package:ecommercexfirebase/presentation/login_screen/login_screen.dart';
import 'package:ecommercexfirebase/presentation/signup_screen/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../main.dart';
import '../presentation/dashboard_screen/dashboard_screen.dart';
import '../presentation/forgot_screen/forgot_screen.dart';
import '../presentation/login_screen/login_cubit.dart';
import '../presentation/splash_screen/splash_screen.dart';

class AppRouter {
  static const String splashScreen = "/splash_screen";
  static const String loginScreen = "/login_screen";
  static const String signupScreen = "/signup_screen";
  static const String homeScreen = "/home_screen";
  static const String cartScreen = "/cart_screen";
  static const String orderScreen = "/order_screen";
  static const String accountScreen = "/account_screen";
  static const String forgotScreen = "/forgot_screen";
  static const String otpVerifiedScreen = "/otp_verified_screen";
  static const String forgotSuccessScreen = "/forgot_success_screen";
  static const String detailsScreen = "/details_screen";
  static const String addProductScreen = "/add_product_screen";
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
        return BlocProvider(create: (_)=>ForgotCubit(),
          child: const ForgotScreen(),
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.forgotSuccessScreen,
      name: AppRouter.forgotSuccessScreen,
      builder: (BuildContext context, GoRouterState state) {
        final cubit = state.extra as ForgotCubit;
        return BlocProvider.value(
          value: cubit,
          child: const ForgotSuccessScreen(),
        );      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.otpVerifiedScreen,
      name: AppRouter.otpVerifiedScreen,
      builder: (BuildContext context, GoRouterState state) {
         return const OtpVerifiedScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.detailsScreen,
      name: AppRouter.detailsScreen,
      builder: (BuildContext context, GoRouterState state) {
        return const DetailsScreen();
      },
    ),
    GoRoute(
      parentNavigatorKey: navigatorKey,
      path: AppRouter.addProductScreen,
      name: AppRouter.addProductScreen,
      builder: (BuildContext context, GoRouterState state) {
         return const AddProductScreen();
      },
    ),
    ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return DashboardScreen(child: child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: AppRouter.homeScreen,
            name: AppRouter.homeScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: AppRouter.cartScreen,
            name: AppRouter.cartScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const CartScreen();
            },
          ),
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: AppRouter.orderScreen,
            name: AppRouter.orderScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const OrderScreen();
            },
          ),
          GoRoute(
            parentNavigatorKey: shellNavigatorKey,
            path: AppRouter.accountScreen,
            name: AppRouter.accountScreen,
            builder: (BuildContext context, GoRouterState state) {
              return const AccountScreen();
            },
          ),

        ])
  ],
);
