import 'package:google_mobile_ads/google_mobile_ads.dart';

InterstitialAd? _interstitialAd;

void _loadInterstitialAd() {
  InterstitialAd.load(
    adUnitId: 'your-interstitial-ad-unit-id',
    request: AdRequest(),
    adLoadCallback: InterstitialAdLoadCallback(
      onAdLoaded: (InterstitialAd ad) {
        _interstitialAd = ad;
      },
      onAdFailedToLoad: (LoadAdError error) {
        print('InterstitialAd failed to load: $error');
      },
    ),
  );
}

void _showInterstitialAd() {
  if (_interstitialAd != null) {
    _interstitialAd!.show();
    _interstitialAd = null; // Dispose the ad after showing it
  }
}