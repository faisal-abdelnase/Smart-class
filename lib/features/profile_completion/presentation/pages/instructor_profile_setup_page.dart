import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/features/auth/presentation/widgets/app_bar_rich_text.dart';
import 'package:smart_class/features/auth/presentation/widgets/build_local_lang.dart';
import 'package:smart_class/features/auth/presentation/widgets/build_theme_toggle.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/instructor_basic_info.dart';
import '../widgets/instructor_details.dart';
import '../widgets/instructor_review.dart';
import '../widgets/progress_bar.dart';



class InstructorProfileSetupPage extends StatefulWidget {
  const InstructorProfileSetupPage({super.key});

  @override
  State<InstructorProfileSetupPage> createState() =>
      _InstructorProfileSetupPageState();
}

class _InstructorProfileSetupPageState
    extends State<InstructorProfileSetupPage> {
  int currentStep = 0;

  

  void nextStep() {
    if (currentStep < 2) {
      setState(() => currentStep++);
    } else {
      
    }
  }

  void previousStep() {
    if (currentStep > 0) {
      setState(() => currentStep--);
    }
  }

  double get progress => (currentStep + 1) / 3;

  Widget _buildStep() {
    switch (currentStep) {
      case 0:
        return const InstructorBasicInfo();
      case 1:
        return const InstructorDetails();
      case 2:
        return const InstructorReview();
      default:
        return const SizedBox();
    }
  }

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
            onPressed: () {},
          ),
          
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProgressBar(progress: progress, step: currentStep),

              const SizedBox(height: 20),

              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildStep(),
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomBar(
        currentStep: currentStep,
        onNext: nextStep,
        onBack: previousStep,
      ),
    );
  }
}