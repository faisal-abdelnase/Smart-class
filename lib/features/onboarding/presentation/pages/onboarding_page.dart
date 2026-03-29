import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/extensions.dart';
import '../../data/datasources/onboarding_local_data.dart';
import '../cubit/onboarding_cubit.dart';
import '../../../../core/theme/app_theme_extensions.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;
    final pages = OnboardingData.pages;

    return BlocProvider(
      create: (context) => sl<OnboardingCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<OnboardingCubit, OnboardingState>(
            listener: (context, state) {
              if (state.isDone) {
                context.pushReplacementNamed(Routes.loginPage);
              }
            },
            child: BlocBuilder<OnboardingCubit, OnboardingState>(
              builder: (context, state) {
                final cubit = context.read<OnboardingCubit>();

                return Column(
                  children: [
                    // Skip
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          cubit.controller.animateToPage(
                            pages.length - 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(AppLocalizations.of(context)!.translate("skip")),
                      ),
                    ),

                    // Pages
                    Expanded(
                      child: PageView.builder(
                        controller: cubit.controller,
                        itemCount: pages.length,
                        onPageChanged: (i) =>
                            cubit.onPageChanged(i, pages.length),
                        itemBuilder: (context, i) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(pages[i].image, height: 250),
                              const SizedBox(height: 30),
                              Text(
                                AppLocalizations.of(context)!.translate(pages[i].title),
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(
                                  AppLocalizations.of(context)!.translate(pages[i].description),
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: t.text3),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                    // Dots Indicator
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(4),
                          width: state.index == i ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: state.index == i
                                ? Theme.of(context).colorScheme.primary
                                : t.border,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Next Button
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.next(pages.length);
                        },
                        child: Text(
                          state.isLast ? AppLocalizations.of(context)!.translate("Get Started") 
                          : AppLocalizations.of(context)!.translate("Next"),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}