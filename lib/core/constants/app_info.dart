import 'package:gpa_pro/core/constants/assets.dart';

abstract class AppInfo {
  static const int rateLater = 10;

  static const String appName = "MRE GPA";
  static const String appId = "com.mrecode.mregpa";
  static const String appVersion = "1.0.0";
  static const int appBuildVersion = 1;

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

 * Android bundleId changed successfully to : com.mrecode.mregpa
 * Android app name changed successfully to : MRE GPA

 * IOS BundleIdentifier changed successfully to : com.mrecode.mregpa
 * IOS app name changed successfully to : MRE GPA

 * MacOS BundleIdentifier changed successfully to : com.mrecode.mregpa
 * MacOS app name changed successfully to : MRE GPA

 * Linux BundleIdentifier changed successfully to : com.mrecode.mregpa
 * Linux appname changed successfully to : MRE GPA

 * Web app name changed successfully to : MRE GPA
 * Windows app name changed successfully to : MRE GPA

 */