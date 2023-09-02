import 'package:gpa_pro/core/constants/injections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocaleControllerAbstract extends GetxController {
  set currentLang(String lang);
  String get currentLang;
  Locale get currentLocale;
  Future<void> onChanged(String? val);
  void deleteSavedLang();
  bool get isInfoChanged;
  bool get isArabicLang;
  T retAr<T>(T inArabic, T inEnglish);
}

class LocaleControllerImp extends LocaleControllerAbstract {
  late SharedPreferences savedData;

  late String _currentLangString;
  late Locale _currentLocal;
  @override
  void onInit() {
    savedData = AppInjections.myServices.sharedPreferences;
    _currentLangString = savedData.getString("lang") ??
        (Get.deviceLocale!.languageCode == "en" ||
                Get.deviceLocale!.languageCode == "ar"
            ? Get.deviceLocale!.languageCode
            : "en");
    _currentLocal = Locale(_currentLangString);
    super.onInit();
  }

  @override
  set currentLang(String lang) => _currentLangString = lang;

  @override
  String get currentLang => _currentLangString;

  @override
  Locale get currentLocale => _currentLocal;

  @override
  Future<void> onChanged(String? val) async {
    _currentLangString = val!;
    await savedData.setString("lang", _currentLangString);
    _currentLocal = Locale(_currentLangString);
    await Get.updateLocale(currentLocale);
    Get.back();
    // update anything
    await AppInjections.initialize.getGrades();

    update();
  }

  @override
  void deleteSavedLang() async {
    await onChanged(Get.deviceLocale!.languageCode);
    await savedData.remove("lang");
  }

  @override
  bool get isInfoChanged => savedData.containsKey("lang");

  @override
  bool get isArabicLang => currentLang == "ar";

  @override
  T retAr<T>(T inArabic, T inEnglish) {
    return isArabicLang ? inArabic : inEnglish;
  }
}
