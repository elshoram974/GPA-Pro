import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:gpa_pro/core/ads/constants/injections.dart';
import 'package:gpa_pro/core/functions/custom_dialogs.dart';
import 'package:gpa_pro/core/localization/lang_constant.dart';

abstract class RewardedInterstitialAdsHelper {
  const RewardedInterstitialAdsHelper();

  static RewardedInterstitialAd? _rewardedInterstitialAd;

  static Future<bool> showAd() async {
    if (!(AdsManger.showAds)) return true;
    if (!(InjectionAds.approved.interstitialApproved)) return true;

    bool watchAd = false;
    await CustomDialog.warningDialog(
      AppConstLang.watchTheAdFirst.tr,
      onConfirm: () async {
        watchAd = true;
        await _loadAd();
        await _rewardedInterstitialAd?.show(
            onUserEarnedReward: (ad, reward) {});
        await _rewardedInterstitialAd?.dispose();
      },
    );
    return watchAd;
  }

  /// Loads an interstitial ad.
  static Future<void> _loadAd() {
    return RewardedInterstitialAd.load(
      adUnitId: AdsManger.rewardedInterstitialAdUnitId,
      request: const AdRequest(),
      rewardedInterstitialAdLoadCallback:
          const RewardedInterstitialAdLoadCallback(
        onAdLoaded: _onAdLoaded,
        onAdFailedToLoad: _onAdFailedToLoad,
      ),
    );
  }

  static void _onAdLoaded(RewardedInterstitialAd ad) {
    ad.fullScreenContentCallback = FullScreenContentCallback(
        // Called when the ad showed the full screen content.
        onAdShowedFullScreenContent: (ad) {},
        // Called when an impression occurs on the ad.
        onAdImpression: (ad) {},
        // Called when the ad failed to show full screen content.
        onAdFailedToShowFullScreenContent: (ad, err) {
          // Dispose the ad here to free resources.
          ad.dispose();
          _rewardedInterstitialAd?.dispose();
        },
        // Called when the ad dismissed full screen content.
        onAdDismissedFullScreenContent: (ad) {
          // Dispose the ad here to free resources.
          ad.dispose();
          _rewardedInterstitialAd?.dispose();
        },
        onAdWillDismissFullScreenContent: (ad) {
          ad.dispose();
          _rewardedInterstitialAd?.dispose();
        });
    // Keep a reference to the ad so you can show it later.
    _rewardedInterstitialAd = ad;
  }

  static void _onAdFailedToLoad(LoadAdError error) {}
}
