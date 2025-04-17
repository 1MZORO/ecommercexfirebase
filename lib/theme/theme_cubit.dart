import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeState> {
  bool value = false;
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)) {
    // _loadTheme();
  }

  void toggleTheme(bool isDark) {
    value = isDark;
    final newTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: newTheme));
    // _saveTheme(isDark);
  }

 /* void toggleTheme(bool isDark) {
    final newTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    emit(newTheme);
    _saveTheme(isDark);
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool('isDarkTheme') ?? false;
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void _saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkTheme', isDark);
  }*/
}
class ThemeState{
  ThemeMode? themeMode;

  ThemeState({this.themeMode});

  ThemeState copyWith({ThemeMode? themeMode}){
    return ThemeState(
      themeMode: themeMode ?? this.themeMode
    );
  }
}
