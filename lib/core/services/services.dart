import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/data/datasource/remote/shared/get_shared_subjects.dart';

import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<void> initUniLinks() async {
    if (AppConstant.isAndroid || AppConstant.isIOS) {
      final String? initialLink = await getInitialLink();
      if (initialLink != null) {
        return await GetSharedSubjects.getSubjects(initialLink);
      }

      linkStream.listen(
        (String? link) async {
          if (link != null) await GetSharedSubjects.getSubjects(link);
          // Parse the link and warn the user, if it is not correct
        },
        onError: (err) async {
          AppSnackBar.messageSnack(err);
          // Handle exception by warning the user their action did not succeed
        },
      );
    }
  }

  Future<MyServices> init() async {
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
