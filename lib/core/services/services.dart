
import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:get/get.dart';
import 'package:gpa_pro/core/functions/snack_bars.dart';
import 'package:gpa_pro/data/datasource/remote/shared/get_shared_subjects.dart';

import 'dart:async';
import 'package:uni_links/uni_links.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<void> initUniLinks() async {
    linkStream.listen(
      (String? link) async {
        if (link != null) await SharedSubjects.getSubjects(link);
        // Parse the link and warn the user, if it is not correct
      },
      onError: (err) {
        AppSnackBar.messageSnack(err);
        // Handle exception by warning the user their action did not succeed
      },
    );

    // NOTE: Don't forget to call _sub.cancel() in dispose()
  }

  Future<MyServices> init() async {
    await initUniLinks();
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
