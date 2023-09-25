import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/controller/user/settings/account_settings_controller.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';
import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
import 'package:gpa_pro/data/model/user.dart';

class UserTileInfo extends StatelessWidget {
  const UserTileInfo(this.userData, {super.key});

  final UserData? userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstant.kDefaultPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            // alignment: AppInjections.locale.isArabicLang
            //     ? Alignment.centerRight
            //     : Alignment.centerLeft,
            child: Text(
              userData == null
                  ? AppConstLang.thereIsNoUser.tr
                  : userData!.completeName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 20, overflow: TextOverflow.ellipsis),
            ),
          ),
          Visibility(
            visible: userData == null,
            replacement: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 0.5 * AppConstant.kDefaultPadding,
                  ),
                  child: Text(
                    "${userData?.email.toLowerCase()}",
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 7,
                      child: TextButton(
                        onPressed: () {
                          Get.lazyPut<AccountSettingControllerImp>(
                              () => AccountSettingControllerImp());
                          Get.toNamed(AppRoute.accountSettings);
                        },
                        child: Text(AppConstLang.accountSettings.tr),
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: TextButton(
                        onPressed: LoginRemotely.logOutButton,
                        child: Text(AppConstLang.logOut.tr),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            child: Center(
              child: TextButton(
                onPressed: () => Get.toNamed(AppRoute.authScreen),
                child: Text(AppConstLang.pressOpenYourAccount.tr),
              ),
            ),
          )
        ],
      ),
    );
  }
}
