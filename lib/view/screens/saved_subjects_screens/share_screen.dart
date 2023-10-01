import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/saved_subjects_controllers/share_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/widgets/home/share_screen_widgets/share_app_bar.dart';
import 'package:gpa_pro/view/widgets/home/share_screen_widgets/share_body.dart';

class ShareScreen extends GetView<ShareSubjectsControllerImp> {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getArguments(
      ModalRoute.of(context)?.settings.arguments as List<SubjectModel>,
    );
    return GetBuilder<ShareSubjectsControllerImp>(
      builder: (_) {
        return DefaultBody(
          onWillPop: controller.onWillPop,
          appBar: const ShareAppBar(),
          body: const ShareBody(),
          pageType: PageType.shareScreen,
          modelList: controller.subjectsList,
          isEmptyBody: controller.subjectsList.isEmpty,
          textWhenEmptyBody: AppConstLang.empty.tr,
          tooltipFloatingButton: '',
          addIsAvailable: false,
        );
      },
    );
  }
}
