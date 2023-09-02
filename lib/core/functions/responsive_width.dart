import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:flutter/material.dart';

double makeWidth(
  BuildContext context,
  double inPhone,
  double inTablet,
  double inDesktop,
) {
  double width = MediaQuery.sizeOf(context).width;

  if (width <= AppDimension.maxPhone) {
    return inPhone;
  } else if (width <= AppDimension.maxTablet) {
    return inTablet;
  }

  return inDesktop;
}
