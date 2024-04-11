// import 'package:gpa_pro/core/constants/public_constant.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// import '../class/ads_manger.dart';
// import '../controller/banner_ads_controller.dart';

// class MyBannerAd extends StatelessWidget {
//   const MyBannerAd({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ColoredBox(
//       color: context.isDarkMode
//           ? const Color(0xff1c1b1f) // color of app bar in dark mode
//           : const Color(0xfffffbfe),
//       child: SafeArea(
//         child: Visibility(
//           visible: AdsManger.showAds,
//           child: GetBuilder<BannerAdsControllerImp>(
//             autoRemove: false,
//             builder: (controller) {
//               return controller.isAdAvailable && AppConstant.isAndroidOrIOS
//                   ? SizedBox(
//                       height: controller.isAdAvailable
//                           ? controller.size!.height.toDouble()
//                           : 0,
//                       width: double.infinity,
//                       child: AdWidget(ad: controller.bannerAd!),
//                     )
//                   : const SizedBox();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class BannerAdsAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const BannerAdsAppBar({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return const MyBannerAd();
//   }

//   @override
//   Size get preferredSize => const Size(double.infinity, 70.0);
// }
