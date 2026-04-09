import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/hive_services.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(_loadTheme());

  static ThemeMode _loadTheme() {
    final isDark = HiveService.box.get('isDark', defaultValue: false);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final isDark = state == ThemeMode.dark;
    HiveService.box.put('isDark', !isDark);
    emit(!isDark ? ThemeMode.dark : ThemeMode.light);
  }

  void setDark() => emit(ThemeMode.dark);
  void setLight() => emit(ThemeMode.light);
}