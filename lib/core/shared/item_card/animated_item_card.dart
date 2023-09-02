import 'package:gpa_pro/core/shared/item_card/item_card.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:flutter/material.dart';

class AnimatedItemCard extends StatelessWidget {
  final ParentModel model;
  final bool isSelected;
  final Animation<double> sizeFactor;
  final void Function()? onTap;
  final void Function()? onLongPress;

  const AnimatedItemCard({
    super.key,
    required this.model,
    required this.isSelected,
    this.onTap,
    this.onLongPress,
    required this.sizeFactor,
  });

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: sizeFactor,
      child: ItemCard(
        model: model,
        isSelected: isSelected,
        onTap: onTap,
        onLongPress: onLongPress,
      ),
    );
  }
}
