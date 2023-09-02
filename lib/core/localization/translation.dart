import 'package:get/get.dart';

import 'dictionary/en.dart';
import 'dictionary/ar.dart';

class MyLocal implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": EnDictionary.english,
        "ar": ArDictionary.arabic,
      };
}