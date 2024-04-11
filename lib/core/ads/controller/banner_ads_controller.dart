// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:gpa_pro/core/ads/constants/injections.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:get/get.dart';
// import 'package:gpa_pro/core/class/net_helper.dart';

// import '../class/ads_manger.dart';

// // abstract class BannerAdsController extends GetxController {
// //   bool get isAdAvailable;
// //   // void loadAdAgain();
// // }

// class BannerAdsControllerImp extends GetxController {
//   BannerAd? bannerAd;
//   AnchoredAdaptiveBannerAdSize? size;

//   bool _isShowingAd = false;

//   bool isAdAvailable = false;

//   @override
//   void onInit() async {
//     _initAd();
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     _closeAd();
//     super.onClose();
//   }

//   void _initAd() {
//     if (bannerAd == null) {
//       _loadBannerAd();
//     }
//   }

//   void _closeAd() {
//     bannerAd?.dispose();
//     bannerAd = null;
//     isAdAvailable = false;
//     _isShowingAd = false;
//   }

//   void refreshAd() {
//     _closeAd();
//     _initAd();
//     update();
//   }

//   Future<void> _getBannerSize() async {
//     size = await AdSize.getCurrentOrientationAnchoredAdaptiveBannerAdSize(
//       Get.width.truncate(),
//     );
//     update();
//   }

//   void _loadBannerAd() async {
//     if (_isShowingAd) {
//       // print('Tried to show ad while already showing an ad.');
//       return;
//     }

//     if (!(InjectionAds.approved.bannerApproved) || !(AdsManger.showAds)) {
//       return;
//     }
//     // print("---------------------------------fff");

//     await _getBannerSize();
//     if (await NetHelper.checkInternet()) {
//       bannerAd = BannerAd(
//         size: size!,
//         adUnitId: AdsManger.bannerAdUnitId,
//         request: const AdRequest(),
//         listener: BannerAdListener(
//           onAdLoaded: (ad) {
//             _isShowingAd = true;
//             isAdAvailable = true;
//             update();
//           },
//           onAdFailedToLoad: (ad, error) async {
//             _isShowingAd = false;
//             isAdAvailable = false;
//             ad.dispose();

//             bannerAd = null;
//             _isShowingAd = false;

//             update();

//             if (!(await NetHelper.checkInternet())) _reloadAd();
//           },
//         ),
//       )..load();
//     } else {
//       _reloadAd();
//     }
//   }

//   void _reloadAd() {
//     NetHelper.checkInternetStream((ConnectivityResult result) async {
//       if (result != ConnectivityResult.none) _loadBannerAd();
//     });
//   }
// }
