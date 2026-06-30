import 'package:flutter/material.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/assignment_entity.dart';


class AssignmentCard extends StatelessWidget {
  const AssignmentCard({super.key, required this.assignment});

  final AssignmentInfo assignment;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;
    final responsive = AppResponsive.of(context);

    return Container(
      padding: EdgeInsets.all(responsive.sp(14)),
      decoration: BoxDecoration(
        color: tokens.surfaceRaised,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: tokens.borderStrong),
        boxShadow: [
          BoxShadow(
            color: tokens.border.withOpacity(0.03),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: responsive.sp(22),
            backgroundColor: assignment.completed ? tokens.greenTint : tokens.primaryTint,
            child: Icon(
              assignment.completed ? Icons.check : Icons.assignment,
              color: tokens.textInverse,
            ),
          ),
          SizedBox(width: responsive.sp(12)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.tr(assignment.titleKey),
                  style: AppTypography.h3.copyWith(color: tokens.text1),
                ),
                if (assignment.subtitleKey != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    context.tr(assignment.subtitleKey!),
                    style: AppTypography.bodySmall.copyWith(color: tokens.text2),
                  ),
                ],
                if (assignment.dueDate != null) ...[
                  const SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: responsive.sp(8), vertical: responsive.sp(4)),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(12),
                      
                    ),
                    child: Text(
                      '${context.tr('due')}: ${assignment.dueDate!.toLocal().toString().split(' ')[0]}',
                      style: AppTypography.bodyXSmall.copyWith(color: AppColors.primary, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: responsive.sp(12)),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: responsive.sp(8), vertical: responsive.sp(4)),
                decoration: BoxDecoration(
                
                  color: assignment.completed ? Colors.green.withOpacity(0.1) : Colors.orange.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  assignment.completed ? context.tr('completed') : context.tr('pending'),
                  style: AppTypography.labelMedium.copyWith(color: assignment.completed ? Colors.green : Colors.orange),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
