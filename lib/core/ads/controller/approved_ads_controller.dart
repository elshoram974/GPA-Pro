// import 'package:get/get.dart';
// import 'package:gpa_pro/data/datasource/remote/user/auth/login.dart';
// import 'package:gpa_pro/data/model/user.dart';

// import 'banner_ads_controller.dart';

// enum Ads {
//   banner,
//   appOpen,
//   interstitial,
//   native,
//   rewarded,
//   rewardedInterstitial,
// }

// class ApprovedAdsController extends GetxController {
//   // bool interstitialApproved = kReleaseMode;
//   bool interstitialApproved = false;
//   // bool nativeApproved = false;
//   // bool rewardedApproved = false;
//   bool rewardedInterstitialApproved = false;
//   bool appOpenApproved = false;
//   bool bannerApproved = false;

//   @override
//   void onInit() {
//     _initApprovedAds();
//     super.onInit();
//   }

//   void _initApprovedAds() {
//     UserData? user = LoginRemotely.savedLogin();
//     if (user != null) _change(user.approvedAds);
//   }

//   void changeApproved(bool isApproved) {
//     _change(isApproved);
//     Get.find<BannerAdsControllerImp>().refreshAd();
//   }

//   void _change(bool isApproved) {
//     bannerApproved = isApproved;
//     appOpenApproved = isApproved;
//     interstitialApproved = isApproved;
//     rewardedInterstitialApproved = isApproved;
//     update();
//   }

//   // void cancelAds(Ads ads, bool approved, {Function? callback}) {
//   //   switch (ads) {
//   //     case Ads.appOpen:
//   //       appOpenApproved = approved;
//   //       break;

//   //     case Ads.banner:
//   //       bannerApproved = approved;
//   //       break;

//   //     case Ads.interstitial:
//   //       interstitialApproved = approved;
//   //       break;

//   //     case Ads.native:
//   //       nativeApproved = approved;
//   //       break;

//   //     case Ads.rewarded:
//   //       rewardedApproved = approved;
//   //       break;

//   //     case Ads.rewardedInterstitial:
//   //       rewardedInterstitialApproved = approved;
//   //       break;

//   //     default:
//   //       throw "there is no type called $ads";
//   //   }

//   //   if (callback != null) {
//   //     callback();
//   //   }
//   //   update();
//   // }
// }
