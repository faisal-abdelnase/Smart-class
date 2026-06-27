import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/extensions.dart';
import 'exam_card.dart';
import 'exam_badge.dart';

class ExamCardState extends State<ExamCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sideColor = isHovered ? AppColors.primary : widget.tokens.primaryTint;
    final cardBg = widget.tokens.surface;
    final borderColor = isHovered ? AppColors.primary : widget.tokens.border;

    return MouseRegion(
      onEnter: (_) => setState(() {
        if (kIsWeb || theme.platform == TargetPlatform.macOS || theme.platform == TargetPlatform.windows || theme.platform == TargetPlatform.linux) {
          isHovered = true;
        }
      }),
      onExit: (_) => setState(() {
        if (kIsWeb || theme.platform == TargetPlatform.macOS || theme.platform == TargetPlatform.windows || theme.platform == TargetPlatform.linux) {
          isHovered = false;
        }
      }),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: cardBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isHovered ? 0.08 : 0.03),
              blurRadius: isHovered ? 20 : 8,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {},
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  width: 8,
                  height: widget.responsive.isCompact ? 110 : 120,
                  decoration: BoxDecoration(
                    color: sideColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.responsive.sp(16),
                      vertical: widget.responsive.sp(18),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.tr(widget.exam.titleKey),
                          style: AppTypography.h3.copyWith(
                            color: widget.tokens.text1,
                            fontSize: widget.compact ? 16 : 18,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          context.tr(widget.exam.subtitleKey),
                          style: AppTypography.bodyMedium.copyWith(
                            color: widget.tokens.text2,
                          ),
                        ),
                        SizedBox(height: widget.responsive.sp(14)),
                        Row(
                          children: [
                            ExamBadge(
                              text: context.tr('${widget.exam.questions} questions'),
                              backgroundColor: widget.tokens.primaryTint,
                              foregroundColor: AppColors.primary,
                            ),
                            const SizedBox(width: 10),
                            ExamBadge(
                              text: context.tr('${widget.exam.minutes} minutes'),
                              backgroundColor: widget.tokens.surfaceOverlay,
                              foregroundColor: widget.tokens.text2,
                            ),
                          ],
                        ),
                        SizedBox(height: widget.responsive.sp(14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: widget.exam.statusColor.withOpacity(0.14),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Text(
                                context.tr(widget.exam.statusLabelKey),
                                style: AppTypography.labelMedium.copyWith(
                                  color: widget.exam.statusColor,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 16,
                              color: widget.tokens.text3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}