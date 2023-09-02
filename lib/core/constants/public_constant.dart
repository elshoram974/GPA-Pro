import 'dart:io';

// import 'package:flutter/foundation.dart';

abstract class AppConstant {
  // static const bool isTest = true;
  static const bool isTest = false;

  // static bool isWindows = true; //when run on chrome
  static bool isWindows = Platform.isWindows;
  static bool isLinux = Platform.isLinux;
  static bool isMacOS = Platform.isMacOS;

  static bool isAndroid = Platform.isAndroid;
  static bool isIOS = Platform.isIOS;

  static bool get isAndroidOrIOS => isAndroid || isIOS;
  static bool get isDesktop => isWindows || isLinux || isMacOS;

  static double get gpaBarHight => 70;
  static double get kDefaultPadding => 18;
  static double get kDefaultRadius => 10;
}
