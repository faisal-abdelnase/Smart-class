import 'package:flutter/material.dart';
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

      default:
        return null;
    }
  }
}