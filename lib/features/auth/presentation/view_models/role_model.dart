import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class RoleModel {
  final String title;
  final String subtitle;
  final String icon;
  final Color color;

  RoleModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });


  static List<RoleModel> roles = [
    RoleModel(
      title: "Instructor",
      subtitle: "Manage classes & exams",
      icon: "👨‍🏫",
      color: AppColors.roleInstructor,
    ),
    RoleModel(
      title: "Student",
      subtitle: "Study & track progress",
      icon: "🎓",
      color: AppColors.roleStudent,
    ),

    RoleModel(
      title: "Parent",
      subtitle: "Monitor your child",
      icon: "👨‍👩‍👧",
      color: AppColors.roleParent,
    ),
  ];
}

