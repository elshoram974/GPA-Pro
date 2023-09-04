import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/auth_screen_paint.dart';

class AuthScreenStructure extends StatelessWidget {
  const AuthScreenStructure({
    super.key,
    required this.body,
    this.onWillPop,
    this.resizeToAvoidBottomInset,
  });

  final Widget body;
  final bool? resizeToAvoidBottomInset;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          forceMaterialTransparency: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () async {
              if (onWillPop != null) {
                if (await onWillPop!()) {
                  return Get.back();
                }
                return;
              }
              return Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              shadows: [BoxShadow(blurRadius: 1)],
            ),
            highlightColor: Colors.transparent,
            color: Colors.white,
          ),
        ),
        body: CustomPaint(
          size: size,
          painter: AuthScreenPaint(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstant.kDefaultPadding,
            ),
            child: Align(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: AppDimension.maxPhone.toDouble()),
                child: body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
