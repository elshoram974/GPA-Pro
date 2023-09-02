class AppPatterns {
  static bool _isArabic(String value) {
    final RegExp isArabic = RegExp(r'^[\u0600-\u06FF\u0900-\u097F-Z0-9\s]+$');
    return isArabic.hasMatch(value);
  }

  static bool _isEnglish(String value) {
    final RegExp englishPattern = RegExp(r'^[a-zA-Z0-9\s]+$');
    return englishPattern.hasMatch(value);
  }

  // --------
  static bool containsSymbolOrNumber(String value) {
    final symbolOrNumberPattern = RegExp(
        r'[Z0-9-\^$*.\[\]{}()?\-"!@#%&/\,><:;_~`+=' // <-- Notice the escaped symbols
        "'" // <-- ' is added to the expression
        ']');
    return symbolOrNumberPattern.hasMatch(value);
  }

  static bool isArabic(String value) =>
      (_isArabic(value) || containsSymbolOrNumber(value)) && !_isEnglish(value);

  static bool isEnglish(String value) =>
      (_isEnglish(value) || containsSymbolOrNumber(value)) && !_isArabic(value);
}
