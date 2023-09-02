import 'package:gpa_pro/core/ads/controller/banner_ads_controller.dart';
import 'package:get/get.dart';

import '../controller/approved_ads_controller.dart';

class InjectionAds {
  static ApprovedAdsController approved = Get.find<ApprovedAdsController>();
  static BannerAdsControllerImp banner = Get.find<BannerAdsControllerImp>();
}
