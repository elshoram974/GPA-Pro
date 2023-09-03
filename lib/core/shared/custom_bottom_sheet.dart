import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomModelSheet extends StatelessWidget {
  final List<Widget> widgets;
  const MyBottomModelSheet({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: AppConstant.kDefaultPadding * 0.9,
            ),
            height: 6,
            width: 60,
            decoration: BoxDecoration(
              color: context.isDarkMode ? Colors.white60 : Colors.black38,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
          Container(
            padding:const EdgeInsets.all(AppConstant.kDefaultPadding),
            decoration: BoxDecoration(
              color: Get.theme.dialogBackgroundColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: ListView(
              shrinkWrap: true,
              children: widgets,
            ),
          ),
        ],
      ),
    );
  }
}
