// RESPONSIVE PADDING WIDGET
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import '../theme/app_dimension.dart';
import 'app_responsive.dart';

class AppScreenPadding extends StatelessWidget {
  final Widget child;
  final bool horizontal;
  final bool vertical;

  const AppScreenPadding({
    super.key,
    required this.child,
    this.horizontal = true,
    this.vertical = false,
  });

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontal ? r.hPadding : 0,
        vertical: vertical ? r.sp(AppDimensions.sp4) : 0,
      ),
      child: child,
    );
  }
}
