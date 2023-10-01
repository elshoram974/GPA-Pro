import 'package:gpa_pro/core/constants/assets.dart';

abstract class AppInfo {
  static const int rateLater = 10;

  static const String appName = "GPA PRO";
  static const String appId = "com.mrecode.gpapro";
  static const String appVersion = "1.0.2";
  static const int appBuildVersion = 3;

  static const String appIcon = AppAssets.appIcon;
  static const String splashIcon = AppAssets.splashIcon;
  static const String splashAndroid12 = AppAssets.splashAndroid12;
  static const String mre = AppAssets.mre;

  // static const String privacyPolicyLink = "https://sites.google.com/view/privacy-policy-cumulative";
  // static const String appLegalese = "Legalese of the app";

  // ----------------------------------------------------
  // if i get those i have to change if state in it
  static const String appleStoreId = "";
  static const String microsoftStoreId = "";
  // ----------------------------------------------------

  static const int dbVersion = 1;
}

/**
 * we use rename package 'rename: ^2.1.1'

 * Android bundleId changed successfully to : com.mrecode.gpapro
 * Android app name changed successfully to : GPA PRO

 * IOS BundleIdentifier changed successfully to : com.mrecode.gpapro
 * IOS app name changed successfully to : GPA PRO

 * MacOS BundleIdentifier changed successfully to : com.mrecode.gpapro
 * MacOS app name changed successfully to : GPA PRO

 * Linux BundleIdentifier changed successfully to : com.mrecode.gpapro
 * Linux appname changed successfully to : GPA PRO

 * Web app name changed successfully to : GPA PRO
 * Windows app name changed successfully to : GPA PRO

 */