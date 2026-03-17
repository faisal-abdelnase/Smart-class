import 'package:flutter/material.dart';


/// Spacing, border radius, icon sizes, and elevation tokens.

class AppDimensions {
  AppDimensions._();


  // SPACING

  static const double sp1  = 4.0;
  static const double sp2  = 8.0;
  static const double sp3  = 12.0;
  static const double sp4  = 16.0;
  static const double sp5  = 20.0;
  static const double sp6  = 24.0;
  static const double sp7  = 28.0;
  static const double sp8  = 32.0;
  static const double sp10 = 40.0;
  static const double sp12 = 48.0;
  static const double sp14 = 56.0;
  static const double sp16 = 64.0;
  static const double sp20 = 80.0;
  static const double sp24 = 96.0;


  // BORDER RADIUS

  static const double rXS   = 4.0;
  static const double rSM   = 8.0;
  static const double rMD   = 12.0;
  static const double rLG   = 16.0;
  static const double rXL   = 20.0;
  static const double r2XL  = 24.0;
  static const double r3XL  = 32.0;
  static const double rFull = 9999.0;

  static const BorderRadius radiusXS   = BorderRadius.all(Radius.circular(rXS));
  static const BorderRadius radiusSM   = BorderRadius.all(Radius.circular(rSM));
  static const BorderRadius radiusMD   = BorderRadius.all(Radius.circular(rMD));
  static const BorderRadius radiusLG   = BorderRadius.all(Radius.circular(rLG));
  static const BorderRadius radiusXL   = BorderRadius.all(Radius.circular(rXL));
  static const BorderRadius radius2XL  = BorderRadius.all(Radius.circular(r2XL));
  static const BorderRadius radius3XL  = BorderRadius.all(Radius.circular(r3XL));
  static const BorderRadius radiusFull = BorderRadius.all(Radius.circular(rFull));


  // ICON SIZES

  static const double iconXS = 14.0;
  static const double iconSM = 18.0;
  static const double iconMD = 22.0;
  static const double iconLG = 28.0;
  static const double iconXL = 36.0;


  // AVATAR SIZES

  static const double avatarXS = 24.0;
  static const double avatarSM = 32.0;
  static const double avatarMD = 40.0;
  static const double avatarLG = 52.0;
  static const double avatarXL = 68.0;


  // COMPONENT HEIGHTS

  static const double buttonHeightSM = 34.0;
  static const double buttonHeightMD = 46.0;
  static const double buttonHeightLG = 54.0;

  static const double inputHeight    = 46.0;
  static const double chipHeight     = 28.0;

  static const double statusBarHeight = 44.0;
  static const double topBarHeight    = 56.0;
  static const double bottomNavHeight = 72.0;
  static const double homeBarHeight   = 34.0;

  // ELEVATION (Material3)

  static const double elevationNone = 0.0;
  static const double elevationXS   = 1.0;
  static const double elevationSM   = 2.0;
  static const double elevationMD   = 4.0;
  static const double elevationLG   = 8.0;
  static const double elevationXL   = 12.0;

  // SCREEN PADDING

  static const EdgeInsets screenPadding    = EdgeInsets.symmetric(horizontal: sp4);
  static const EdgeInsets screenPaddingLG  = EdgeInsets.symmetric(horizontal: sp5);
  static const EdgeInsets cardPadding      = EdgeInsets.all(sp4);
  static const EdgeInsets cardPaddingLG    = EdgeInsets.all(sp5);
  static const EdgeInsets sectionPadding   = EdgeInsets.only(bottom: sp8);
}
