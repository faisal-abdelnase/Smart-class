import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/utils/constants.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/hive_services.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/theme/theme_cubit.dart';
import '../../../../core/utils/extensions.dart';
import '../../../auth/data/models/user_model.dart';
import '../../../onboarding/domain/repositories/onboarding_repository.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> logoScale;
  late Animation<double> textOpacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    logoScale = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
    );

    textOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );

    controller.forward();

    Future.delayed(const Duration(seconds: 3), () async {
      if(!mounted) return;


      String lang = HiveService.box.get('lang', defaultValue: 'en');

      if (lang == 'ar') {
        context.read<LocaleCubit>().changeLanguage('ar');
      } else {
        context.read<LocaleCubit>().changeLanguage('en');
      }

    String theme = HiveService.box.get('theme', defaultValue: 'light');

    if (theme == 'dark') {
      context.read<ThemeCubit>().setDark();
    } else {
      context.read<ThemeCubit>().setLight();
    }


      final isFirst = sl<OnboardingRepository>().isFirstTime();
      final firebaseService = sl<FirebaseService>();
      final currentUser = firebaseService.currentUser;

      if (isFirst) {
        context.pushReplacementNamed(Routes.onboardingPage);
      } else if (currentUser != null && currentUser.emailVerified) {
        try {
          final userMap = await firebaseService.getUserData(currentUser.uid);
          final user = UserModel.fromJson(userMap, currentUser.uid);
          if (!mounted) return;
          context.pushReplacementNamed(
            user.isProfileComplete ? Routes.homePage : Routes.profileCompletionPage,
            arguments: user.isProfileComplete ? null : user,
          );
        } catch (_) {
          if (!mounted) return;
          context.pushReplacementNamed(Routes.roleSelectionPage);
        }
      } else {
        context.pushReplacementNamed(Routes.roleSelectionPage);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final t = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientPrimary,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: logoScale,
                child: Image.asset(
                  Constants.logo,
                  scale: 5,
                ),
              ),
              const SizedBox(height: 20),
              FadeTransition(
                opacity: textOpacity,
                child: Text("EduConnect", 
                style: AppTypography.displayLarge.copyWith(
                  color: Colors.white
                )
                ,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
