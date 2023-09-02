import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/view/widgets/settings/about_app/app_version_widget.dart';
import 'package:gpa_pro/view/widgets/settings/about_app/privacy_policy_button.dart';
import 'package:gpa_pro/view/widgets/settings/about_app/review_app_button.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(title: Text(AppConstLang.aboutApp.tr)),
        body: const CustomBodyListView(
          children: [
            AppVersionWidget(),
            PrivacyPolicy(),
            ReviewAppButton(),
            // MoreInfo(),
          ],
        ),
      ),
    );
  }
}
