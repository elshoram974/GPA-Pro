import 'package:gpa_pro/controller/saved_subjects_controllers/upload_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/upload/upload_appbar.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/upload/upload_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onOpenUploadPage(context);
    return GetBuilder<UploadSavedTxtFileImp>(
      builder: (controller) {
        return DefaultBody(
          onWillPop: controller.onWillPop,
          appBar: const UploadAppBar(),
          body: const UploadBody(),
          addIsAvailable: false,
          pageType: PageType.addScreen,
          modelList: controller.subjectsList,
          allSubjects: controller.allSubjects(),
          tooltipFloatingButton: '',
        );
      },
    );
  }

  void onOpenUploadPage(BuildContext context) {
    Get.lazyPut(() => UploadSavedTxtFileImp());

    // https://gpapro.mrecode.com/?user_sharedId=2315632153
    // https://gpapro.mrecode.com/?user_sharedId=4946729692

    final String? userSharedId = Get.parameters['user_sharedId'];
    UploadArguments argument;
    if (userSharedId == null) {
      argument = ModalRoute.of(context)?.settings.arguments as UploadArguments;
    } else {
      argument = UploadArguments(
          title: AppConstLang.sharedSubjects.tr,
          newSubjects: [SubjectModel.getNewEmpty()]);
    }

    Get.find<UploadSavedTxtFileImp>().getArguments(argument);
  }
}
