import 'package:gpa_pro/core/constants/app_info.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final double hight;
  final double? radius;
  const AppIcon({
    super.key,
    this.hight = 50,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(radius ?? AppConstant.kDefaultRadius)),
      child: Image.asset(
        AppInfo.appIcon,
        height: hight,
      ),
    );
  }
}
