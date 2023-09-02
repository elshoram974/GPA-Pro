import 'package:gpa_pro/core/class/gpa_functions_model.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/item_card/card_body/card_body.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final ParentModel model;
  final bool isSelected;
  final bool showAddress;
  final void Function()? onTap;
  final void Function()? onLongPress;
  const ItemCard({
    super.key,
    required this.model,
    this.onTap,
    this.onLongPress,
    this.isSelected = false,
    this.showAddress = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: AppConstant.kDefaultPadding / 3),
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      color: GPAFunctionsHelper([model]).color(context),
      child: InkWell(
        onSecondaryTap: AppConstant.isDesktop ? onLongPress : null,
        onLongPress: onLongPress,
        onTap: onTap,
        child: CardBody(
          isSelected: isSelected,
          showAddress: showAddress,
          model: model,
          onTap: onTap,
        ),
      ),
    );
  }
}
