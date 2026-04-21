enum UserRole { instructor, student, parent }

extension UserRoleX on UserRole {
  String get label {
    switch (this) {
      case UserRole.instructor:
        return 'Instructor';
      case UserRole.student:
        return 'Student';
      case UserRole.parent:
        return 'Parent';
    }
  }

  String get onboardingSubtitle {
    switch (this) {
      case UserRole.instructor:
        return 'Tell us about your teaching background so we can personalize your instructor workspace.';
      case UserRole.student:
        return 'Tell us how you learn best so we can tailor your student experience.';
      case UserRole.parent:
        return 'Tell us about your children and learning goals so we can personalize your parent dashboard.';
    }
  }

  static UserRole fromName(String value) {
    return UserRole.values.firstWhere(
      (role) => role.name == value,
      orElse: () => UserRole.instructor,
    );
  }
}

enum LearningStyle { online, offline }

extension LearningStyleX on LearningStyle {
  String get label {
    switch (this) {
      case LearningStyle.online:
        return 'Online';
      case LearningStyle.offline:
        return 'Offline';
    }
  }
}
