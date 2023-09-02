import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

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
