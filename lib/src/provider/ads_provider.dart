import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdsProvider extends ChangeNotifier {
  BannerAd? _bannerAd;
  InterstitialAd? _interstitialAd;

  BannerAd? get bannerAd => _bannerAd;
  InterstitialAd? get interstitialAd => _interstitialAd;

  void loadBannerAd() {
    final adUnitId = 'ca-app-pub-3940256099942544/6300978111'; // Banner reklam birimi kimliğinizi buraya ekleyin

    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          // Reklam başarıyla yüklendiğinde yapılacak işlemler
          notifyListeners();
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          // Reklam yüklenemediğinde yapılacak işlemler
          ad.dispose();
        },
      ),
    );

    _bannerAd!.load();
  }

 
}
