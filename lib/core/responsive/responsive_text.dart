// RESPONSIVE TEXT
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'app_responsive.dart';

class AppText extends StatelessWidget {
  final String text;
  final double baseFontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextStyle? style;

  const AppText(
    this.text, {
    super.key,
    required this.baseFontSize,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: style!.copyWith(fontSize: r.sp(baseFontSize)) 
    );
  }
}