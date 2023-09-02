import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/locale_controller.dart';
import '../translation.dart';

class ChangeLangButton extends StatelessWidget {
  const ChangeLangButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocaleControllerImp>(
      builder: (_) => CustomListTile(
        title: AppConstLang.changeLang.tr,
        subtitle: pressChange(_.currentLang.tr),
        leadingIcon: Icons.language,
        onTap: dialogLang,
      ),
    );
  }

  String pressChange(String phrase) {
    if (Get.locale == const Locale("ar")) {
      return "${AppConstLang.pressToChange.tr} ${AppConstLang.lang.tr} $phrase";
    }
    return "${AppConstLang.pressToChange.tr} $phrase ${AppConstLang.lang.tr}";
  }

  void dialogLang() {
    Get.defaultDialog(
      title: AppConstLang.changeLang.tr,
      content: GetBuilder<LocaleControllerImp>(
        builder: (controller) => Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            MyLocal().keys.keys.length,
            (index) => RadioListTile<String>(
              value: MyLocal().keys.keys.toList()[index],
              groupValue: controller.currentLang,
              onChanged: controller.onChanged,
              title: Text(MyLocal().keys.keys.toList()[index].tr),
            ),
          ),
        ),
      ),
    );
  }
}
