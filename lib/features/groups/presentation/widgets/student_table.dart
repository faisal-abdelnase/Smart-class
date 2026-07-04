import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/utils/extensions.dart';
import '../../domain/entities/student_entity.dart';

class StudentTable extends StatelessWidget {
  const StudentTable({
    super.key,
    required this.students,
  });

  final List<StudentInfo> students;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;
    final responsive = AppResponsive.of(context);

    return Container(
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: tokens.borderStrong),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: responsive.sp(12),
        vertical: responsive.sp(8),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: responsive.screenWidth),
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(tokens.bgAlt),
            dataRowColor: WidgetStateProperty.all(tokens.surfaceRaised),
            columnSpacing: 24,
            dataRowMaxHeight: 80,

            horizontalMargin: 12,
            columns: [
              DataColumn(label: Text(context.tr('student'), style: AppTypography.h5.copyWith(color: tokens.text2))),
              DataColumn(label: Text(context.tr('average_score'), style: AppTypography.h5.copyWith(color: tokens.text2))),
              DataColumn(label: Text(context.tr('attendance') , style: AppTypography.h5.copyWith(color: tokens.text2))),
              DataColumn(label: Text(context.tr('status'), style: AppTypography.h5.copyWith(color: tokens.text2))),
            ],
            rows: students.map((s) => _dataRow(context, s, tokens)).toList(),
          ),
        ),
      ),
    );
  }

  DataRow _dataRow(BuildContext context, StudentInfo s, AppThemeColors tokens) {
    return DataRow(
      cells: [
        DataCell(
          Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: s.avatarColor.withValues(alpha: 40),
              child: Text(
                s.name.split(' ').map((e) => e.isNotEmpty ? e[0] : '').take(2).join().toUpperCase(),
                style: AppTypography.h5.copyWith(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(s.name, style: AppTypography.h4.copyWith(color: tokens.text1)),
                const SizedBox(height: 4),
                Text(context.tr('student_id', {'id': s.id}), style: AppTypography.bodySmall.copyWith(color: tokens.text3)),
              ],
            ),
          ],
        )),
        DataCell(
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: s.colorScore(s.averageScore).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text('${s.averageScore}%', style: AppTypography.bodySmall.copyWith(color: s.colorScore(s.averageScore), fontWeight: FontWeight.w700)),
        )),
        DataCell(Text('${s.attendance}%', style: AppTypography.bodyMedium.copyWith(color: tokens.text2, fontWeight: FontWeight.w700))),
        DataCell(Row(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(color: s.status.badgeColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
            Text(context.tr(s.status.labelKey), style: AppTypography.bodyMedium.copyWith(color: tokens.text2, fontWeight: FontWeight.w700)),
          ],
        )),
      ],
    );
  }
}
