import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gpa_pro/core/ads/class/ads_manger.dart';
import 'package:gpa_pro/core/ads/constants/injections.dart';

abstract class InterstitialAdsHelper {
  const InterstitialAdsHelper();

  static InterstitialAd? _interstitialAd;

  static Future<void> init() async {
    if (!(AdsManger.showAds)) return;
    if (!(InjectionAds.approved.interstitialApproved)) return;

    await _loadAd();
    await _interstitialAd?.dispose();
  }

  static Future<void> showAd() async {
    if (!(AdsManger.showAds)) return;
    if (!(InjectionAds.approved.interstitialApproved)) return;
    await _loadAd();
    await _interstitialAd?.show();
    await _interstitialAd?.dispose();
  }

  /// Loads an interstitial ad.
  static Future<void> _loadAd() {
    return InterstitialAd.load(
      adUnitId: AdsManger.interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: const InterstitialAdLoadCallback(
        onAdLoaded: _onAdLoaded,
        onAdFailedToLoad: _onAdFailedToLoad,
      ),
    );
  }

  static void _onAdFailedToLoad(LoadAdError error) {}

  static void _onAdLoaded(InterstitialAd ad) {
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
      // Called when a click is recorded for an ad.
      onAdClicked: (ad) {},
    );

    // Keep a reference to the ad so you can show it later.
    _interstitialAd = ad;
  }
}
