import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowAddressCard extends StatelessWidget {
  const ShowAddressCard({super.key, required this.model});
  final ParentModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: AppColor.tableColor(context).withOpacity(0.3)),
        Text(
          model.address,
          style: context.textTheme.bodySmall,
        ),
      ],
    );
  }
}
