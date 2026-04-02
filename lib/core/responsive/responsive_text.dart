// RESPONSIVE TEXT
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'app_responsive.dart';

class AppText extends StatelessWidget {
  final String text;
  final double baseFontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final String? fontFamily;
  final double? letterSpacing;
  final double? height;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppText(
    this.text, {
    super.key,
    required this.baseFontSize,
    this.fontWeight,
    this.color,
    this.fontFamily,
    this.letterSpacing,
    this.height,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: r.fs(baseFontSize),
        fontWeight: fontWeight,
        color: color,
        letterSpacing: letterSpacing,
        height: height,
      ),
    );
  }
}