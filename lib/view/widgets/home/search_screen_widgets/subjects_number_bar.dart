import 'package:gpa_pro/controller/home/search_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectsNumberBar extends StatelessWidget {
  const SubjectsNumberBar(this.controller, {super.key});
  final SearchControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "${AppConstLang.numberOfSubjects.tr}:- ".tr,
              style: context.textTheme.bodyLarge,
              children: [
                TextSpan(
                  style: context.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  text: "${controller.length}",
                )
              ],
            ),
          ),
        ),
        ChoiceChip(
          onSelected: controller.onSelectCalculateChip,
          label: Text(AppConstLang.notCalculated.tr),
          selected: controller.isNotCalculate,
        ),
      ],
    );
  }
}
