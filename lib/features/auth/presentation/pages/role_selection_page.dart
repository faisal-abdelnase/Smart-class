import 'package:flutter/material.dart';
import '../../../../core/responsive/responsive_builder.dart';
import '../widgets/build_desktop.dart';
import '../widgets/build_mobile.dart';
import '../widgets/build_tablet.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppResponsiveBuilder(
      mobile: (context, r) => buildMobile(context, r),
      tablet: (context, r) => buildTablet(context, r),
      desktop: (context, r) => buildDesktop(context, r),
    );
  }
}