import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final String data;
  final bool inMid;
  const CustomDivider({
    super.key,
    required this.data,
    this.inMid = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppConstant.kDefaultPadding,
        bottom: AppConstant.kDefaultPadding / 2,
      ),
      child: Row(
        children: [
          Expanded(flex: inMid ? 5 : 2, child: const Divider()),
          Text("    $data    "),
          const Expanded(flex: 5, child: Divider()),
        ],
      ),
    );
  }
}
