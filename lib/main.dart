import 'package:flutter/material.dart';
import 'core/di/service_locator.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/services/hive_services.dart';
import 'core/theme/app_theme.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();
  await init();

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

    // ignore: no_leading_underscores_for_local_identifiers
    ThemeMode _themeMode = ThemeMode.system;
      // ignore: unused_element
      void toggleTheme() => setState(() {
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