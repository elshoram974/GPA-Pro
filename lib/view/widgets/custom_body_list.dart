import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class CustomBodyListView extends StatelessWidget {
  final List<Widget> children;
  const CustomBodyListView({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppConstant.kDefaultPadding),
      shrinkWrap: true,
      children: children,
    );
  }
}
