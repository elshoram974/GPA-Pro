import 'package:gpa_pro/controller/home/add_controller/add_controller.dart';
import 'package:gpa_pro/core/shared/item_card/animated_item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSubjects extends StatelessWidget {
  const ListSubjects({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<AddControllerImp>(
          builder: (controller) {
            return AnimatedList(
              physics: const NeverScrollableScrollPhysics(),
              key: controller.listKey,
              initialItemCount: controller.subjectsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index, animation) {
                return AnimatedItemCard(
                  sizeFactor: animation,
                  model: controller.subjectsList[index],
                  isSelected: controller.subjectsList[index].isSelected,
                  onTap: () => controller.onTap(index),
                  onLongPress: () => controller.onLongPress(index),
                );
              },
            );
          },
        ),
        const SizedBox(height: 90),
      ],
    );
  }
}
