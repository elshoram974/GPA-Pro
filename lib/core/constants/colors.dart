import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';

abstract class AppColor {
  // in light mode
  static const Color _primary = Color(0xff765de4);
  static const Color _secondary = Color(0xFFB5BCE7);

  // in dark mode
  static const Color _primaryDark = Color(0xFF432170);
  static const Color _secondaryDark = Color(0xFFB2B4C3);

  static Color get primary => Get.isDarkMode ? _primaryDark : _primary;
  static Color get secondary => Get.isDarkMode ? _secondaryDark : _secondary;

  static LinearGradient linearGradient = LinearGradient(
    colors: [primary, secondary],
  );

  static Color textButton() => Colors.blue;

  static Color tableColor(BuildContext context) {
    return context.isDarkMode ? Colors.white12 : Colors.black;
  }

  static Color selectedColor(BuildContext context) {
    return context.isDarkMode ? Colors.blue.shade500 : Colors.blue.shade300;
  }

  static PdfColor pdfTextColor() {
    return Get.isDarkMode ? PdfColors.white : PdfColors.black;
  }
}
