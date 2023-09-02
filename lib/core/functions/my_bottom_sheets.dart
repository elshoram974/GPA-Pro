import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/contact_us/view/contact_us_bottom_sheet.dart';
import 'package:gpa_pro/view/screens/home/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheets {
  static Future<T?> customSheet<T>(Widget bottomSheet) async {
    return await Get.bottomSheet(bottomSheet, elevation: 0);
  }

  static Future<T?> contactUs<T>() => customSheet(const ContactUsWidget());

  static Future<T?> openDetails<T>(DetailsArguments arguments) {
    return Get.bottomSheet(
      const DetailsScreen(),
      settings: RouteSettings(arguments: arguments),
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(2 * AppConstant.kDefaultRadius),
        ),
      ),
    );
  }
}
