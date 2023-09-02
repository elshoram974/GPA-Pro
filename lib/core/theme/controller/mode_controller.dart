import 'package:gpa_pro/core/constants/injections.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../keys.dart';

abstract class ChangeModeController extends GetxController {
  void changeThemeMode(String key);
  ThemeMode get savedMode;

  String get currentMode;

  void deleteSavedMode();
  bool get isInfoChanged;
}

class ModeController extends ChangeModeController {
  late SharedPreferences savedData;

  late String _currentModeString;
  late ThemeMode _savedMode;

  @override
  void onInit() {
    savedData = AppInjections.myServices.sharedPreferences;
    _currentModeString = savedData.getString("theme_mode") ?? "system_mode";
    _savedMode = Keys.myKey()[_currentModeString]!;
    super.onInit();
  }

  void _currentMode(String key) {
    _currentModeString = key;
    savedData.setString("theme_mode", key);
  }

  @override
  String get currentMode => _currentModeString;

  @override
  void changeThemeMode(String? key) {
    _currentMode(key!);
    _savedMode = Keys.myKey()[currentMode]!;
    Get.changeThemeMode(_savedMode);
    update();
  }

  @override
  ThemeMode get savedMode => _savedMode;

  @override
  void deleteSavedMode() async {
    changeThemeMode("system_mode");
    await savedData.remove("theme_mode");
  }

  @override
  bool get isInfoChanged => savedData.containsKey("theme_mode");
}
