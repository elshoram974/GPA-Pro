import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:gpa_pro/core/ads/constants/injections.dart';

abstract class RewardedInterstitialAdsHelper {
  const RewardedInterstitialAdsHelper();

  static RewardedInterstitialAd? _rewardedInterstitialAd;

  static Future<void> showAd(
      [void Function(AdWithoutView, RewardItem)? onUserEarnedReward]) async {
    if (!(InjectionAds.approved.rewardedInterstitialApproved) ||
        !(AdsManger.showAds)) {
      return;
    }

    await _loadAd();
    await _rewardedInterstitialAd?.show(
      onUserEarnedReward: onUserEarnedReward ?? (ad, reward) {},
    );
    await _rewardedInterstitialAd?.dispose();
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
      },
      // Called when the ad dismissed full screen content.
      onAdDismissedFullScreenContent: (ad) {
        // Dispose the ad here to free resources.
        ad.dispose();
      },
    );
    // Keep a reference to the ad so you can show it later.
    _rewardedInterstitialAd = ad;
  }

  static void _onAdFailedToLoad(LoadAdError error) {}
}
