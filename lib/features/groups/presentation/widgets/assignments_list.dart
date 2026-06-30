import 'package:flutter/material.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/assignment_entity.dart';
import 'assignment_card.dart';


class AssignmentsList extends StatelessWidget {
  const AssignmentsList({super.key, required this.compact});

  final bool compact;

  static final List<AssignmentInfo> sample = [
    AssignmentInfo(
      id: 'a1',
      titleKey: 'ch5_exercises',
      subtitleKey: 'problems_3_8',
      dueDate: DateTime.now().add(const Duration(days: 2)),
      completed: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    if (sample.isEmpty) {
      return Center(
        child: Text(
          context.tr('group_assignments_empty'),
          style: TextStyle(color: tokens.text2),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: responsive.hPadding, vertical: responsive.sp(12)),
      itemCount: sample.length,
      separatorBuilder: (_, _) => SizedBox(height: responsive.sp(12)),
      itemBuilder: (context, index) {
        final item = sample[index];
        return AssignmentCard(assignment: item);
      },
    );
  }
}
