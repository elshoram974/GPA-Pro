import 'package:gpa_pro/controller/home/search_controller.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/view/widgets/home/search_screen_widgets/replacement_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchedSubjects extends StatelessWidget {
  const SearchedSubjects(this.controller, {super.key});

  final SearchControllerImp controller;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !controller.isNoSavedSubjects,
      replacement: ReplacementSearchWidget(AppConstLang.noSubjectToSearch.tr),
      child: Visibility(
        visible: !controller.notFound,
        replacement: ReplacementSearchWidget(
          "'${controller.myQuery}' ${AppConstLang.notFound.tr}",
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: List.generate(
            controller.length,
            (index) => ItemCard(
              onTap: () => controller.onTap(index),
              showAddress: true,
              model: controller.getModel(index),
            ),
          ),
        ),
      ),
    );
  }
}
