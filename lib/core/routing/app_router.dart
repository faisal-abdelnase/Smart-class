import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import 'routes.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

import '../../features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter {

  AppRouter._();

  static Route? generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){

      case Routes.splashPage:
        return MaterialPageRoute(builder: (_)=> SplashPage());

      case Routes.onboardingPage:
          return MaterialPageRoute(builder: (_)=> OnboardingPage());

      case Routes.loginPage:
          return MaterialPageRoute(builder: (_)=> LoginPage());

      default:
        return null;
    }
  }
}