import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/grades_view.dart';
import 'package:gpa_pro/view/widgets/initialize/initialize/realized_hours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppConstLang.initialize.tr)),
      body: const CustomBodyListView(
        children: [
          RealizedHours(),
          SizedBox(height: 30),
          GradesView(),
        ],
      ),
    );
  }
}
