import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum StudentStatus { active, atRisk, struggling }

extension StudentStatusExtensions on StudentStatus {
  String get labelKey {
    return switch (this) {
      StudentStatus.active => 'active',
      StudentStatus.atRisk => 'at_risk',
      StudentStatus.struggling => 'struggling',
    };
  }

  Color get badgeColor {
    return switch (this) {
      StudentStatus.active => AppColors.green,
      StudentStatus.atRisk => AppColors.yellow,
      StudentStatus.struggling => AppColors.red,
    };
  }

  
}

class StudentInfo {
  const StudentInfo({
    required this.name,
    required this.id,
    required this.averageScore,
    required this.attendance,
    required this.status,
    required this.avatarColor,
  });

  final String name;
  final String id;
  final double averageScore;
  final int attendance;
  final StudentStatus status;
  final Color avatarColor;


  Color colorScore(double score) {
    return switch (score) {
      >= 90 => AppColors.green,
      >= 70 && < 90 => AppColors.primary,
      >= 50 && < 70 => AppColors.yellow,
      _ => AppColors.red,
    };
  }
}