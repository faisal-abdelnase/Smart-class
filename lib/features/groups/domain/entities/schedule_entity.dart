import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

enum EventType { lecture, exam, review, project }

class ScheduleEvent {
  ScheduleEvent({required this.date, required this.title, required this.type});

  final DateTime date;
  final String title;
  final EventType type;


  static Color colorFor(EventType t , double alpha) {
    switch (t) {
      case EventType.lecture:
        return AppColors.primary.withValues(alpha: alpha);
      case EventType.exam:
        return AppColors.red.withValues(alpha: alpha);
      case EventType.review:
        return AppColors.yellow.withValues(alpha: alpha);
      case EventType.project:
        return AppColors.purple.withValues(alpha: alpha);
    }
  }
}