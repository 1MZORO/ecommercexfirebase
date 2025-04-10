import 'package:flutter/material.dart';

import '../utils/colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPurple,
  useMaterial3: true,
  scaffoldBackgroundColor: colorLightOne,
  appBarTheme: const AppBarTheme(
    backgroundColor: colorLightOne,
    foregroundColor: colorBlack,
    elevation: 0,
  ),
  colorScheme: ColorScheme.light(
    primary: colorPurple,
    secondary: colorPurple,
    background: colorLightOne,
    surface: colorLightTwo,
    onPrimary: colorLightOne,
    onSecondary: colorLightOne,
    onSurface: colorBlack,
    onBackground: colorBlack,
    error: colorRed,
    onError: colorLightOne,
  ),
  cardColor: colorLightTwo,
  iconTheme: const IconThemeData(color: colorBlack),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: colorBlack),
    bodyMedium: TextStyle(color: colorBlack),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: colorPurple,
  scaffoldBackgroundColor: colorDarkOne,
  appBarTheme: const AppBarTheme(
    backgroundColor: colorDarkOne,
    foregroundColor: colorLightOne,
    elevation: 0,
  ),
  colorScheme: ColorScheme.dark(
    primary: colorPurple,
    secondary: colorPurple,
    background: colorDarkOne,
    surface: colorDarkTwo,
    onPrimary: colorLightOne,
    onSecondary: colorLightOne,
    onSurface: colorLightOne,
    onBackground: colorLightOne,
    error: colorRed,
    onError: colorDarkOne,
  ),
  cardColor: colorDarkTwo,
  iconTheme: const IconThemeData(color: colorLightOne),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: colorLightOne),
    bodyMedium: TextStyle(color: colorLightOne),
  ),
);
