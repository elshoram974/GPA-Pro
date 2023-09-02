import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_body/empty_list.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_body/subject_divider.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_body/list_subjects.dart';
import 'package:gpa_pro/view/widgets/home/add_screen_widgets/add_body/select_year_term.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBody extends StatelessWidget {
  const AddBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddControllerImp>(
      builder: (controller) {
        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          shrinkWrap: true,
          children: [
            const SelectYearAndTerm(),
            const SubjectDivider(),
            const ListSubjects(),
            EmptyList(isEmpty: controller.subjectsList.isEmpty),
          ],
        );
      },
    );
  }
}
