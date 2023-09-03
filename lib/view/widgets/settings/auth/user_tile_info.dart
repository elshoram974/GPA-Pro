import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

class UserTileInfo extends StatelessWidget {
  const UserTileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstant.kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstLang.thereIsNoUser.tr,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontSize: 20),
          ),
          Center(
            child: TextButton(
              onPressed: () => Get.toNamed(AppRoute.authScreen),
              child: Text(AppConstLang.pressOpenYourAccount.tr),
            ),
          )
        ],
      ),
    );
  }
}
