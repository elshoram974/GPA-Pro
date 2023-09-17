import 'package:gpa_pro/controller/home/year_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/address_widget.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class YearBody extends StatelessWidget {
  const YearBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<YearControllerImp>(
      builder: (controller) {
        return CustomBodyListView(
          canSync: true,
          children: [
            AddressWidget(address: controller.thisYear.address),
            ...List.generate(
              controller.semesterList.length,
              (index) => ItemCard(
                model: controller.semesterList[index],
                isSelected: controller.semesterList[index].isSelected,
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
