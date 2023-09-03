import 'package:gpa_pro/controller/home/search_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/home/search_screen_widgets/searched_subjects.dart';
import 'package:gpa_pro/view/widgets/home/search_screen_widgets/subjects_number_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key, required this.query});

  final String query;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchControllerImp>(
      builder: (_) {
        _.search(query);
        return CustomBodyListView(
          children: [
            SubjectsNumberBar(_),
            const SizedBox(height: AppConstant.kDefaultPadding),
            SearchedSubjects(_),
          ],
        );
      },
    );
  }
}
