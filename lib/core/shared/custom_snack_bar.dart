import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController customSnackBar({
  String? message,
  Duration? duration,
  double? borderRadius,
  double? verticalMargin,
  double? horizontalMargin,
  SnackStyle snackStyle = SnackStyle.FLOATING,
}) {
  Get.closeAllSnackbars();

  return Get.showSnackbar(
    GetSnackBar(
      duration: duration ?? const Duration(seconds: 2),
      message: message,
      borderRadius: borderRadius ?? 1.5 * AppConstant.kDefaultRadius,
      snackStyle: snackStyle,
      margin: EdgeInsets.symmetric(
        vertical: verticalMargin ?? 3 * AppConstant.kDefaultPadding,
        horizontal: horizontalMargin ?? 2 * AppConstant.kDefaultPadding,
      ),
    ),
  );
}
