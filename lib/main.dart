import 'package:ecommercexfirebase/routes/router.dart';
import 'package:ecommercexfirebase/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var navigatorKey = GlobalKey<NavigatorState>();
var shellNavigatorKey = GlobalKey<NavigatorState>();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MaterialApp.router(
    debugShowCheckedModeBanner: false,
    theme: lightTheme,
    darkTheme: darkTheme,
    themeMode: ThemeMode.system,
    routerConfig: router,
  ),
  );
}

