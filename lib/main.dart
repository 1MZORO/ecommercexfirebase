import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/theme/theme.dart';
import 'package:ecommercexfirebase/theme/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

var navigatorKey = GlobalKey<NavigatorState>();
var shellNavigatorKey = GlobalKey<NavigatorState>();
late SharedPreferences sharedPreferences;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    BlocProvider(
      create: (_)=>ThemeCubit(),
      child: BlocBuilder<ThemeCubit,ThemeState>(builder: (context,state){
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: context.read<ThemeCubit>().state.themeMode,
          routerConfig: router,
        );
      }),
    ),
  );
}

