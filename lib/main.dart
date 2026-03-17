import 'package:flutter/material.dart';
import 'package:smart_class/core/routing/app_router.dart';
import 'package:smart_class/core/routing/routes.dart';

void main() {
  runApp(const SmartClass());
}

class SmartClass extends StatelessWidget {
  const SmartClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: Routes.splashPage,
    );
  }
}