import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import '../../domain/entities/exam_entity.dart';
import '../widgets/exam_card.dart';

class GroupExamsView extends StatelessWidget {
  const GroupExamsView({super.key, required this.compact});

  final bool compact;

  static final List<ExamInfo> examItems = [
    ExamInfo(
      titleKey: 'algebra_midterm',
      subtitleKey: 'algebra_midterm_subtitle',
      questions: 30,
      minutes: 60,
      statusLabelKey: 'tomorrow',
      statusColor: AppColors.primary,
    ),
    ExamInfo(
      titleKey: 'chapter_4_quiz',
      subtitleKey: 'chapter_4_quiz_subtitle',
      questions: 15,
      minutes: 30,
      statusLabelKey: 'completed',
      statusColor: AppColors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return ListView.separated(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.hPadding,
        vertical: responsive.sp(16),
      ),
      itemCount: examItems.length,
      separatorBuilder: (_, _) => SizedBox(height: responsive.sp(14)),
      itemBuilder: (context, index) {
        final exam = examItems[index];
        return ExamCard(
          exam: exam,
          compact: compact,
          tokens: tokens,
          responsive: responsive,
        );
      },
    );
  }
}








