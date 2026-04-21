import 'package:flutter/material.dart';
import 'package:smart_class/core/di/service_locator.dart';
import 'package:smart_class/core/routing/routes.dart';
import 'package:smart_class/core/services/firebase_auth_service.dart';
import 'package:smart_class/core/utils/auth_dialogs.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/auth/data/models/user_model.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';
import 'package:smart_class/features/profile_completion/presentation/controllers/profile_completion_controller.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/instructor/instructor_profile_details_step.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/parent/parent_profile_details_step.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/shared/profile_completion_basic_info.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/shared/profile_completion_review.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/shared/profile_completion_shell.dart';
import 'package:smart_class/features/profile_completion/presentation/widgets/student/student_profile_details_step.dart';

class ProfileCompletionPage extends StatefulWidget {
  const ProfileCompletionPage({
    super.key,
    this.user,
    this.initialRole,
  });

  final UserModel? user;
  final UserRole? initialRole;

  @override
  State<ProfileCompletionPage> createState() => _ProfileCompletionPageState();
}

class _ProfileCompletionPageState extends State<ProfileCompletionPage> {
  late final ProfileCompletionController controller;
  bool isSubmitting = false;

  @override
  void initState() {
    super.initState();
    controller = ProfileCompletionController(_resolveUser());
  }

  UserModel _resolveUser() {
    if (widget.user != null) return widget.user!;

    final firebaseUser = sl<FirebaseService>().currentUser;
    final role = widget.initialRole ?? UserRole.instructor;

    return UserModel(
      id: firebaseUser?.uid ?? '',
      name: firebaseUser?.displayName ?? role.label,
      email: firebaseUser?.email ?? '',
      role: role,
    );
  }

  Future<void> _handleNext() async {
    if (!controller.canContinue) return;

    if (!controller.isLastStep) {
      controller.nextStep();
      return;
    }

    setState(() => isSubmitting = true);
    final updatedUser = controller.buildCompletedUser();

    try {
      await sl<FirebaseService>().updateUserData(
        uid: updatedUser.id,
        data: updatedUser.toJson(),
      );
      if (!mounted) return;
      showSuccessSnackBar(context, 'Profile completed successfully');
      context.pushReplacementNamed(Routes.homePage);
    } catch (_) {
      if (!mounted) return;
      showErrorSnackBar(context, 'Unable to save profile right now');
    } finally {
      if (mounted) {
        setState(() => isSubmitting = false);
      }
    }
  }

  Future<void> _handleLogout() async {
    await sl<FirebaseService>().logout();
    if (!mounted) return;
    context.pushNamedAndRemoveUntil(
      Routes.roleSelectionPage,
      predicate: (_) => false,
    );
  }

  Widget _buildStep() {
    switch (controller.currentStep) {
      case 0:
        return ProfileCompletionBasicInfo(controller: controller);
      case 1:
        switch (controller.role) {
          case UserRole.instructor:
            return InstructorProfileDetailsStep(controller: controller);
          case UserRole.student:
            return StudentProfileDetailsStep(controller: controller);
          case UserRole.parent:
            return ParentProfileDetailsStep(controller: controller);
        }
      case 2:
        return ProfileCompletionReview(controller: controller);
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return ProfileCompletionShell(
          progress: controller.progress,
          step: controller.currentStep,
          stepTitle: controller.stepTitle,
          currentStep: controller.currentStep,
          onNext: _handleNext,
          onBack: controller.previousStep,
          canContinue: controller.canContinue,
          isSubmitting: isSubmitting,
          onLogout: _handleLogout,
          child: _buildStep(),
        );
      },
    );
  }
}
