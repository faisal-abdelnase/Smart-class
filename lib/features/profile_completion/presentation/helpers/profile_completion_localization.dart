import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/features/auth/domain/entiyies/user.dart';
import 'package:smart_class/features/auth/domain/entiyies/user_role.dart';

String getLocalizedUserRole(BuildContext context, UserRole role) {
  switch (role) {
    case UserRole.instructor:
      return context.tr('instructor_role');
    case UserRole.student:
      return context.tr('student_role');
    case UserRole.parent:
      return context.tr('parent_role');
  }
}

String getLocalizedOnboardingSubtitle(BuildContext context, UserRole role) {
  switch (role) {
    case UserRole.instructor:
      return context.tr('instructor_onboarding_subtitle');
    case UserRole.student:
      return context.tr('student_onboarding_subtitle');
    case UserRole.parent:
      return context.tr('parent_onboarding_subtitle');
  }
}

String getLocalizedRoleDetailsTitle(BuildContext context, UserRole role) {
  switch (role) {
    case UserRole.instructor:
      return context.tr('instructor_details');
    case UserRole.student:
      return context.tr('student_details');
    case UserRole.parent:
      return context.tr('parent_details');
  }
}

String getProfileCompletionStepTitle(
  BuildContext context,
  int currentStep,
  UserRole role,
) {
  switch (currentStep) {
    case 0:
      return context.tr('basic_info');
    case 1:
      return getLocalizedRoleDetailsTitle(context, role);
    case 2:
      return context.tr('review');
    default:
      return context.tr('profile');
  }
}

String getLocalizedEducationLevel(BuildContext context, EducationLevel level) {
  switch (level) {
    case EducationLevel.primary:
      return context.tr('education_level_primary');
    case EducationLevel.preparatory:
      return context.tr('education_level_preparatory');
    case EducationLevel.secondary:
      return context.tr('education_level_secondary');
    case EducationLevel.university:
      return context.tr('education_level_university');
  }
}

String getLocalizedLearningStyle(BuildContext context, LearningStyle style) {
  switch (style) {
    case LearningStyle.online:
      return context.tr('learning_style_online');
    case LearningStyle.offline:
      return context.tr('learning_style_offline');
  }
}

String getLocalizedExperienceValue(BuildContext context, double value) {
  final yearsValue = value == 20 ? '20+' : value.round().toString();
  return context.tr(
    'experience_years_value',
    {'years': yearsValue},
  );
}

String getLocalizedChildTitle(BuildContext context, int index) {
  return context.tr('child_index', {'number': '${index + 1}'});
}

String getLocalizedChildrenSummary(BuildContext context, List<Child> children) {
  return children
      .map(
        (child) => [
          child.name.trim().isEmpty
              ? context.tr('unnamed_child')
              : child.name.trim(),
          child.school.trim().isEmpty
              ? context.tr('no_school')
              : child.school.trim(),
          child.grade.trim().isEmpty
              ? context.tr('no_grade')
              : child.grade.trim(),
        ].join(' - '),
      )
      .join(' | ');
}
