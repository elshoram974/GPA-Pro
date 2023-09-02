import 'package:flutter/material.dart';

abstract class AppDimension {
  static const int maxPhone = 500;
  static const int maxTablet = 900;
  // static const int desktop = 500;



  static double getColorCellSizeFromFontSize(BuildContext context) {
  double textScale = MediaQuery.textScaleFactorOf(context);

  double height = 0;

  if (textScale <= 1) {
    height = 47;
  } else if (textScale > 1.2) {
    height = 54;
    // } else if (textScale > 1) {
  } else {
    height = 52;
  }
  return height;
}
}
