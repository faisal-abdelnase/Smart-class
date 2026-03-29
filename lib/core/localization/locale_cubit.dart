import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../services/hive_services.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(Locale(_getSavedLang()));

  static String _getSavedLang() {
    return HiveService.box.get('lang', defaultValue: 'en');
  }

  void changeLanguage(String langCode) {
    HiveService.box.put('lang', langCode);
    emit(Locale(langCode));
  }
}