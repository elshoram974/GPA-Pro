import 'package:gpa_pro/controller/saved_subjects_controllers/upload_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:gpa_pro/view/widgets/saved_subjects_widgets/upload/upload_headers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadBody extends StatelessWidget {
  const UploadBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UploadSavedTxtFileImp>(
      builder: (controller) {
        return Visibility(
          visible: controller.subjectsList.isNotEmpty,
          replacement: Center(child: Text(AppConstLang.empty.tr)),
          child: CustomBodyListView(
            children: [
              const UploadHeaderPart(),
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
          ),
        );
      },
    );
  }
}
