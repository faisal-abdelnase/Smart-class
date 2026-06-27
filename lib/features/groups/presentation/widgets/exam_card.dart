import 'package:flutter/material.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../domain/entities/exam_entity.dart';
import 'exam_card_state.dart';

class ExamCard extends StatefulWidget {
  const ExamCard({super.key, 
    required this.exam,
    required this.compact,
    required this.tokens,
    required this.responsive,
  });

  final ExamInfo exam;
  final bool compact;
  final AppThemeColors tokens;
  final AppResponsive responsive;

  @override
  ExamCardState createState() => ExamCardState();
}