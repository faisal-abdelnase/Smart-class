import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/di/service_locator.dart';
import '../../features/auth/presentation/cubit/verify_email_cubit.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/role_selection_page.dart';
import '../../features/auth/presentation/pages/verify_email_page.dart';
import '../../features/profile_completion/presentation/pages/instructor_profile_setup_page.dart';
import 'routes.dart';
import '../../features/splash/presentation/pages/splash_page.dart';

import '../../features/onboarding/presentation/pages/onboarding_page.dart';

class AppRouter {

  AppRouter._();

  static Route? generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){

      case Routes.splashPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> SplashPage(),
        );

      case Routes.onboardingPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> OnboardingPage(),
        );

      case Routes.loginPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> LoginPage(),
        );

      case Routes.signupPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> SignupPage(),
        );

      case Routes.forgotPasswordPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> ForgotPasswordPage(),
        );

      case Routes.roleSelectionPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_)=> RoleSelectionPage(),
        );

        case Routes.verifyEmailPage:
          return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (_) => sl<VerifyEmailCubit>(),
              child: const VerifyEmailPage(),
            ),
          );

          case Routes.studentFormPage:
            // return MaterialPageRoute(builder: (_) => StudentFormPage());

          case Routes.instructorFormPage:
            return MaterialPageRoute(builder: (_) => InstructorProfileSetupPage());

          case Routes.parentFormPage:
            // return MaterialPageRoute(builder: (_) => ParentFormPage());

          case Routes.homePage:
            // return MaterialPageRoute(builder: (_) => HomePage());

      default:
        return null;
    }
  }
}