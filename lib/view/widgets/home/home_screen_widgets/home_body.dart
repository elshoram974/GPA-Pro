import 'package:gpa_pro/controller/home/home_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/view/widgets/custom_body_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return CustomBodyListView(
          children: [
            ...List.generate(
              controller.yearsList.length,
              (index) => ItemCard(
                model: controller.yearsList[index],
                isSelected: controller.yearsList[index].isSelected,
                onTap: () => controller.onTap(index),
                onLongPress: () => controller.onLongPress(index),
              ),
            ),
            SizedBox(height: AppConstant.gpaBarHight + 20),
          ],
        );
      },
    );
  }
}
