import 'package:gpa_pro/core/ads/class/interstitial_ads.dart';
import 'package:gpa_pro/core/ads/class/rewarded_interstitial_ads.dart';
import 'package:gpa_pro/core/constants/public_constant.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../controller/approved_ads_controller.dart';
import '../constants/real_id_ads.dart';
import '../constants/test_id_ads.dart';
import 'app_open_ads.dart';

class AdsManger {
  static const bool _testMode = AppConstant.isTest;
  static bool get showAds => AppConstant.isAndroidOrIOS;
  // static bool get showAds => false;

  // static Future<InitializationStatus> get instance async =>
  //     await MobileAds.instance.initialize();

  static Future<InitializationStatus?> initialAds() async {
    if (showAds) {
      InitializationStatus instance = await MobileAds.instance.initialize();
      Get.put<ApprovedAdsController>(ApprovedAdsController());

      await OpenAppAdsHelper.loadAd();
      await InterstitialAdsHelper.init();
      await RewardedInterstitialAdsHelper.init();
      return instance;
    }
    return null;
  }

  static String get appId {
    if (showAds) {
      if (AppConstant.isAndroid) {
        return AdsId.appIdAndroid;
      } else if (AppConstant.isIOS) {
        return AdsId.appIdIOS;
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }

  static String get appOpenAdUnitId {
    if (showAds) {
      if (_testMode) {
        if (AppConstant.isAndroid) {
          return TestIdAds.appOpenAndroid;
        } else if (AppConstant.isIOS) {
          return TestIdAds.appOpenIOS;
        }
      } else {
        if (AppConstant.isAndroid) {
          return AdsId.appOpenAndroid;
        } else if (AppConstant.isIOS) {
          return AdsId.appOpenIOS;
        }
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }

  static String get bannerAdUnitId {
    if (showAds) {
      if (_testMode) {
        if (AppConstant.isAndroid) {
          return TestIdAds.bannerAndroid;
        } else if (AppConstant.isIOS) {
          return TestIdAds.bannerIOS;
        }
      } else {
        if (AppConstant.isAndroid) {
          return AdsId.bannerAndroid;
        } else if (AppConstant.isIOS) {
          return AdsId.bannerIOS;
        }
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }

  static String get interstitialAdUnitId {
    if (showAds) {
      if (_testMode) {
        if (AppConstant.isAndroid) {
          return TestIdAds.interstitialAndroid;
        } else if (AppConstant.isIOS) {
          return TestIdAds.interstitialIOS;
        }
      } else {
        if (AppConstant.isAndroid) {
          return AdsId.interstitialAndroid;
        } else if (AppConstant.isIOS) {
          return AdsId.interstitialIOS;
        }
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }

  static String get nativeAdUnitId {
    if (showAds) {
      if (_testMode) {
        if (AppConstant.isAndroid) {
          return TestIdAds.nativeAndroid;
        } else if (AppConstant.isIOS) {
          return TestIdAds.nativeIOS;
        }
      } else {
        if (AppConstant.isAndroid) {
          return AdsId.nativeAndroid;
        } else if (AppConstant.isIOS) {
          return AdsId.nativeIOS;
        }
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }

  static String get rewardedAdUnitId {
    if (showAds) {
      if (_testMode) {
        if (AppConstant.isAndroid) {
          return TestIdAds.rewardedAndroid;
        } else if (AppConstant.isIOS) {
          return TestIdAds.rewardedIOS;
        }
      } else {
        if (AppConstant.isAndroid) {
          return AdsId.rewardedAndroid;
        } else if (AppConstant.isIOS) {
          return AdsId.rewardedIOS;
        }
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }

  static String get rewardedInterstitialAdUnitId {
    if (showAds) {
      if (_testMode) {
        if (AppConstant.isAndroid) {
          return TestIdAds.rewardedInterstitialAndroid;
        } else if (AppConstant.isIOS) {
          return TestIdAds.rewardedInterstitialIOS;
        }
      } else {
        if (AppConstant.isAndroid) {
          return AdsId.rewardedInterstitialAndroid;
        } else if (AppConstant.isIOS) {
          return AdsId.rewardedInterstitialIOS;
        }
      }
    }
    throw UnsupportedError("you canceled ads check showAds");
  }
}
