import 'package:flutter/material.dart';

class Keys {
  static Map<String, ThemeMode> myKey() {
    return {
      "light_mode": ThemeMode.light,
      "dark_mode": ThemeMode.dark,
      "system_mode": ThemeMode.system,
    };
  }
}