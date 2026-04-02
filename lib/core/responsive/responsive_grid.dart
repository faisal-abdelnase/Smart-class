// RESPONSIVE GRID
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import '../theme/app_dimension.dart';
import 'app_responsive.dart';

class AppGrid extends StatelessWidget {
  final List<Widget> children;
  final int? crossAxisCount;
  final double spacing;
  final double runSpacing;
  final double childAspectRatio;

  const AppGrid({
    super.key,
    required this.children,
    this.crossAxisCount,
    this.spacing = AppDimensions.sp3,
    this.runSpacing = AppDimensions.sp3,
    this.childAspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    final cols = crossAxisCount ?? r.cols;
    return GridView.count(
      crossAxisCount: cols,
      crossAxisSpacing: r.sp(spacing),
      mainAxisSpacing: r.sp(runSpacing),
      childAspectRatio: childAspectRatio,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: children,
    );
  }
}