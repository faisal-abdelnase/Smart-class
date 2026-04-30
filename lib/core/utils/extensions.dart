import 'package:flutter/material.dart';
import 'package:smart_class/core/localization/app_localizations.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  String tr(String key, [Map<String, String> params = const {}]) {
    return AppLocalizations.of(this)?.translate(key, params: params) ?? key;
  }

  String? trOrNull(String? key, [Map<String, String> params = const {}]) {
    if (key == null) return null;
    return tr(key, params);
  }
}



extension Navigation on BuildContext {

  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();
}
