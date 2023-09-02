import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/routes.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';

import 'dart:async';

import 'package:uni_links/uni_links.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<void> initUniLinks() async {

    linkStream.listen((String? link) {
      if (link != null) {
        Uri uri = Uri.parse(link);
        String? sharedId = uri.queryParameters['user_sharedId'];
        Get.toNamed(
          AppRoute.uploadScreen,
          parameters: sharedId == null ? null : {'user_sharedId': sharedId},
        );
        if (sharedId != null) {
          AppSnackBar.messageSnack(sharedId);
        } else {
          AppSnackBar.messageSnack('Error in Link');
        }
      }
      // Parse the link and warn the user, if it is not correct
    }, onError: (err) {
      AppSnackBar.messageSnack(err);
      // Handle exception by warning the user their action did not succeed
    });

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  Future<MyServices> init() async {
    initUniLinks();
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

Future<void> initialServices() async {
  // await portraitUp();

  await Get.putAsync(() => MyServices().init());
  await AdsManger.initialAds();
  // await AdsManger.instance;
}
