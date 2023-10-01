import 'package:get/get.dart';

enum Ads {
  banner,
  appOpen,
  interstitial,
  native,
  rewarded,
  rewardedInterstitial,
}

class ApprovedAdsController extends GetxController {
  // bool interstitialApproved = kReleaseMode;
  bool interstitialApproved = true;
  // bool nativeApproved = true;
  // bool rewardedApproved = true;
  bool rewardedInterstitialApproved = true;
  bool appOpenApproved = true;
  bool bannerApproved = true;

  // void cancelAds(Ads ads, bool approved, {Function? callback}) {
  //   switch (ads) {
  //     case Ads.appOpen:
  //       appOpenApproved = approved;
  //       break;

  //     case Ads.banner:
  //       bannerApproved = approved;
  //       break;

  //     case Ads.interstitial:
  //       interstitialApproved = approved;
  //       break;

  //     case Ads.native:
  //       nativeApproved = approved;
  //       break;

  //     case Ads.rewarded:
  //       rewardedApproved = approved;
  //       break;

  //     case Ads.rewardedInterstitial:
  //       rewardedInterstitialApproved = approved;
  //       break;

  //     default:
  //       throw "there is no type called $ads";
  //   }

  //   if (callback != null) {
  //     callback();
  //   }
  //   update();
  // }
}
