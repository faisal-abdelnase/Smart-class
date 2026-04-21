import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../domain/entiyies/user_role.dart';

class RoleModel {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;
  final UserRole role;

  RoleModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.role,
  });


  static List<RoleModel> roles = [
    RoleModel(
      title: "Instructor",
      subtitle: "Manage classes & exams",
      icon: "👨‍🏫",
      color: AppColors.roleInstructor,
      role: UserRole.instructor,
    ),
    RoleModel(
      title: "Student",
      subtitle: "Study & track progress",
      icon: "🎓",
      color: AppColors.roleStudent,
      role: UserRole.student,
    ),

    RoleModel(
      title: "Parent",
      subtitle: "Monitor your child",
      icon: "👨‍👩‍👧",
      color: AppColors.roleParent,
      role: UserRole.parent,
    ),
  ];
}

