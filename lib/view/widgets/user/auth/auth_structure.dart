import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/colors.dart';
import 'package:gpa_pro/core/constants/dimensions.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/auth_screen_paint.dart';

class AuthScreenStructure extends StatelessWidget {
  const AuthScreenStructure({
    super.key,
    required this.body,
    this.onWillPop,
    this.title,
    this.wantPadding = true,
  });

  final bool wantPadding;
  final Widget body;
  final String? title;
  final Future<bool> Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: title == null
              ? null
              : Text(
                  title!,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: AppColor.secondary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
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
            child: ListView(
              padding: wantPadding ? null : EdgeInsets.zero,
              children: [
                Align(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: AppDimension.maxPhone.toDouble(),
                    ),
                    child: body,
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                SizedBox(height: MediaQuery.viewInsetsOf(context).bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
