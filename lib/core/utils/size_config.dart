import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';


class SizeConfig {

  static bool isMobile(BuildContext context) {
    return context.screenWidth < 767;
  }
  
  static bool isTablet(BuildContext context) {
    return context.screenWidth >= 768 && 
    context.screenWidth < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return context.screenWidth >= 1024;
  }
}