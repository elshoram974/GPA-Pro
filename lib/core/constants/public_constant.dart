import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class AppConstant {
  static const bool isTest = true;
  // static const bool isTest = false;

  // static bool isWindows = true; //when run on chrome
  static bool isWindows = kIsWeb ? false : Platform.isWindows;
  static bool isLinux   = kIsWeb ? false : Platform.isLinux;
  static bool isMacOS   = kIsWeb ? false : Platform.isMacOS;

  static const bool isWeb = kIsWeb;

  static bool isAndroid = kIsWeb ? false : Platform.isAndroid;
  static bool isIOS     = kIsWeb ? false : Platform.isIOS;

  static bool get isAndroidOrIOS => isAndroid || isIOS;
  static bool get isDesktop => isWindows || isLinux || isMacOS || isWeb;

  static const double gpaBarHight = 70;
  static const double kDefaultPadding = 18;
  static const double kDefaultRadius = 10;
}
