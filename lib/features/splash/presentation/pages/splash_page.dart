import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/core/utils/constants.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../core/localization/locale_cubit.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/hive_services.dart';
import '../../../../core/utils/extensions.dart';
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

    Future.delayed(const Duration(seconds: 3), () {
      if(!mounted) return;


      String lang = HiveService.box.get('lang', defaultValue: 'en');

    if (lang == 'ar') {
      context.read<LocaleCubit>().changeLanguage('ar');
    } else {
      context.read<LocaleCubit>().changeLanguage('en');
    }

      final isFirst = sl<OnboardingRepository>().isFirstTime();

      if (isFirst) {
        context.pushReplacementNamed(Routes.onboardingPage);
      } else {
        context.pushReplacementNamed(Routes.loginPage);
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
    final t = Theme.of(context).extension<AppThemeColors>()!;

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
                  color: t.textInverse
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