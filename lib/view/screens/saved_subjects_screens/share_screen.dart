import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/saved_subjects_controllers/share_controller.dart';
import 'package:gpa_pro/core/class/argument_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/default_body.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/data/model/subject_model.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/home/my_appbar/my_app_bar.dart';

class ShareScreen extends GetView<ShareSubjectsImp> {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getArguments(
      ModalRoute.of(context)?.settings.arguments as List<SubjectModel>,
    );

    return DefaultBody(
      onWillPop: controller.onWillPop,
      appBar: const ShareAppBar(),
      body: const ShareBody(),
      pageType: PageType.semesterScreen,
      modelList: controller.subjectsList,
      isEmptyBody: controller.subjectsList.isEmpty,
      textWhenEmptyBody: AppConstLang.addYear.tr,
      tooltipFloatingButton: AppConstLang.addYear.tr,
      addIsAvailable: true,
    );
  }
}

class ShareAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShareAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareSubjectsImp>(
      builder: (controller) {
        return MyAppBar(
          title: AppConstLang.share.tr,
          pageType: PageType.shareScreen,
          isAllSelected: controller.isAllSelected,
          isSelected: controller.isSelected,
          remove: controller.removeSharedSubject,
          selectAllOrDeselect: controller.selectAllOrDeselect,
          selectedLength: controller.selectedLength,
          selectedSubjects: controller.selectedList,
          moreActions: [
            IconButton(
                onPressed: controller.linkButton,
                icon: const Icon(Icons.link_outlined))
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class ShareBody extends StatelessWidget {
  const ShareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareSubjectsImp>(
      builder: (controller) {
        return CustomBodyListView(
          canSync: true,
          children: [
            ...List.generate(
              controller.subjectsList.length,
              (index) => ItemCard(
                showAddress: true,
                model: controller.subjectsList[index],
                isSelected: controller.subjectsList[index].isSelected,
                onTap: controller.isSelected
                    ? () => controller.onTap(index)
                    : null,
                onLongPress: () => controller.onLongPress(index),
              ),
            ),
            const SizedBox(height: AppConstant.gpaBarHight + 20),
          ],
        );
      },
    );
  }
}
