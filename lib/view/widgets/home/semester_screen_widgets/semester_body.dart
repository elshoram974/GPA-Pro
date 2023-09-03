import 'package:gpa_pro/controller/home/semester_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/address_widget.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SemesterBody extends StatelessWidget {
  const SemesterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SemesterControllerImp>(
      builder: (controller) {
        return CustomBodyListView(
          children: [
            AddressWidget(address: controller.thisSemester.address),
            ...List.generate(
              controller.subjectsList.length,
              (index) => ItemCard(
                model: controller.subjectsList[index],
                isSelected: controller.subjectsList[index].isSelected,
                onTap: () => controller.onTap(index),
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
