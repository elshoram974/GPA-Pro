import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _lightTheme =
      ThemeData.light(useMaterial3: true).copyWith();
      // textTheme: Typography().black.apply()
  static final ThemeData _darkTheme =
      ThemeData.dark(useMaterial3: true).copyWith();

  static ThemeData get light => _lightTheme;
  static ThemeData get dark => _darkTheme;
}
