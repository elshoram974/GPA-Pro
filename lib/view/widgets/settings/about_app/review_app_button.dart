import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/core/shared/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_review/in_app_review.dart';

class ReviewAppButton extends StatelessWidget {
  const ReviewAppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomListTile(
      title: AppConstLang.reviewApp.tr,
      miniIcon: true,
      subtitle: "${AppConstLang.pressHereTo.tr} ${AppConstLang.reviewApp.tr}",
      leadingIcon: Icons.radio_button_unchecked_outlined,
      onTap: () async {
        try {
          // final InAppReview inAppReview = InAppReview.instance;

          // if (await inAppReview.isAvailable()) {
          // await inAppReview.requestReview();

          if (AppConstant.isAndroid) {
            final InAppReview inAppReview = InAppReview.instance;

            await inAppReview.openStoreListing();
          } else {
            AppSnackBar.messageSnack(AppConstLang.notAvailableNow.tr);
          }

          // inAppReview.openStoreListing(
          //   appStoreId: AppInfo.appStoreId,
          //   microsoftStoreId: AppInfo.microsoftStoreId,
          // );
          // }
        } catch (e) {
          AppSnackBar.messageSnack(AppConstLang.notAvailableNow.tr);
        }
      },
    );
  }
}
