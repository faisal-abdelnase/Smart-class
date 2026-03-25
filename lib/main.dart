import 'package:flutter/material.dart';
import 'package:smart_class/core/routing/app_router.dart';
import 'package:smart_class/core/routing/routes.dart';
import 'package:smart_class/core/theme/app_theme.dart';

void main() {
  runApp(const SmartClass());
}

class SmartClass extends StatefulWidget {
  const SmartClass({super.key});

  @override
  State<SmartClass> createState() => _SmartClassState();
}

class _SmartClassState extends State<SmartClass> {
  @override
  Widget build(BuildContext context) {

    ThemeMode _themeMode = ThemeMode.system;
      void _toggleTheme() => setState(() {
        _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
      });
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      title: "Smart Class",
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splashPage,
    );
  }
}