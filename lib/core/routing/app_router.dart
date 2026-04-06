import 'package:flutter/material.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/role_selection_page.dart';
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

      case Routes.signupPage:
        return MaterialPageRoute(builder: (_)=> SignupPage());
  

      case Routes.forgotPasswordPage:
        // return MaterialPageRoute(builder: (_)=> ForgotPasswordPage());
        return null;

      case Routes.roleSelectionPage:
        return MaterialPageRoute(builder: (_)=> RoleSelectionPage());
        

      default:
        return null;
    }
  }
}