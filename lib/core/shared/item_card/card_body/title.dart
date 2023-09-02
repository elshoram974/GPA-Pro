import 'package:gpa_pro/data/model/parent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTitle extends StatelessWidget {
  const CardTitle({
    super.key,
    required this.model,
  });

  final ParentModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        model.name.tr,
        style: context.textTheme.titleLarge,
      ),
    );
  }
}
