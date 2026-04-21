import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/features/auth/presentation/widgets/app_bar_rich_text.dart';
import 'package:smart_class/features/auth/presentation/widgets/build_local_lang.dart';
import 'package:smart_class/features/auth/presentation/widgets/build_theme_toggle.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/bottom_bar.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/progress_bar.dart';

class ProfileCompletionShell extends StatelessWidget {
  const ProfileCompletionShell({
    super.key,
    required this.progress,
    required this.step,
    required this.stepTitle,
    required this.child,
    required this.currentStep,
    required this.onNext,
    required this.onBack,
    required this.canContinue,
    required this.isSubmitting,
    required this.onLogout,
  });

  final double progress;
  final int step;
  final String stepTitle;
  final Widget child;
  final int currentStep;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final bool canContinue;
  final bool isSubmitting;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;

    return Scaffold(
      backgroundColor: t.bg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const AppBarRichText(),
        actions: [
          buildThemeToggle(t, context),
          buildLocalLang(context),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: onLogout,
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.zero,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 960),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProgressBar(
                      progress: progress,
                      step: step,
                      stepTitle: stepTitle,
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        switchInCurve: Curves.easeOutCubic,
                        switchOutCurve: Curves.easeInCubic,
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(
        currentStep: currentStep,
        onNext: onNext,
        onBack: onBack,
        canContinue: canContinue,
        isSubmitting: isSubmitting,
      ),
    );
  }
}
