import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/shared/item_card/card_body/address_widget.dart';
import 'package:gpa_pro/core/shared/item_card/card_body/subtitle_list.dart';
import 'package:gpa_pro/core/shared/item_card/card_body/title.dart';
import 'package:gpa_pro/core/shared/item_card/card_body/trailing_list_tile.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:flutter/material.dart';

class CardBody extends StatelessWidget {
  const CardBody({
    super.key,
    required this.model,
    required this.isSelected,
    required this.showAddress,
    this.onTap,
  });

  final bool isSelected;
  final bool showAddress;
  final ParentModel model;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: EdgeInsets.symmetric(
        vertical: AppConstant.kDefaultPadding / 1.3,
        horizontal: AppConstant.kDefaultPadding * 1.5,
      ),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.selectedColor(context) : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CardTitle(model: model),
                    CardSubtitle(model: model, onTap: onTap),
                  ],
                ),
              ),
              CardTrailing(model: model, onTap: onTap),
            ],
          ),
          Visibility(
            visible: showAddress,
            child: ShowAddressCard(model: model),
          ),
        ],
      ),
    );
  }
}
