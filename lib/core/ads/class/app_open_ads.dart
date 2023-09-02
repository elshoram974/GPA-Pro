import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'ads_manger.dart';
import '../constants/injections.dart';

class OpenAppAdsHelper {
  static AppOpenAd? _appOpenAd;

  static Future<void> loadAd() async {
    if (!InjectionAds.approved.appOpenApproved) {
      _appOpenAd?.dispose();
      return;
    }
    await AppOpenAd.load(
      adUnitId: AdsManger.appOpenAdUnitId,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) async {
          _appOpenAd = ad;
          await _appOpenAd!.show();

          _appOpenAd!.dispose();
        },
        onAdFailedToLoad: (error) {
          _appOpenAd?.dispose();
        },
      ),
    );
  }
}
