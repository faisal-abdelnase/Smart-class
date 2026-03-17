import 'package:flutter/material.dart';
import 'package:smart_class/core/routing/routes.dart';
import 'package:smart_class/features/splash/presentation/pages/splash_page.dart';

class AppRouter {

  AppRouter._();

  static Route? generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){

      case Routes.splashPage:
        return MaterialPageRoute(builder: (_)=> SplashPage());

      default:
        return null;
    }
  }
}