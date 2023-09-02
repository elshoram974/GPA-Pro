import 'package:gpa_pro/core/shared/item_card/card_body/responsive/phone_subtitle.dart';
import 'package:gpa_pro/core/shared/item_card/card_body/responsive/tablet_desktop_subtitle.dart';
import 'package:gpa_pro/core/shared/layout_builder.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:flutter/material.dart';

class CardSubtitle extends StatelessWidget {
  const CardSubtitle({super.key, required this.model, this.onTap});

  final ParentModel model;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ResponsiveInMaxWidth(
      phone: SubTitleInPhone(model: model, onTap: onTap),
      tablet: SubTitleTabletDesktop(model: model, onTap: onTap),
      desktop: SubTitleTabletDesktop(model: model, onTap: onTap),
    );
  }
}
