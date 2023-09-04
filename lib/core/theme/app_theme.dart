import 'package:flutter/material.dart';
import 'package:gpa_pro/core/constants/colors.dart';

class AppTheme {
  static final ThemeData _lightTheme =
      ThemeData.light(useMaterial3: true).copyWith();
  // textTheme: Typography().black.apply()
  static final ThemeData _darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        disabledForegroundColor: AppColor.secondary,
        foregroundColor: AppColor.textButton(),
      ),
    ),
  );

  static ThemeData get light => _lightTheme;
  static ThemeData get dark => _darkTheme;
}
