import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/saved_subjects_controllers/share_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';

class ShareBody extends StatelessWidget {
  const ShareBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShareSubjectsControllerImp>(
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
