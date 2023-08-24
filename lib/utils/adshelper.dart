import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Adshelper {
  static final adshelper = Adshelper._();

  Adshelper._();

  BannerAd? bannerAd;
  InterstitialAd? interads;
  RewardedAd? rewardedAd;
  NativeAd? nativeAd;

  void load_Bannerad() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-3940256099942544/6300978111",
        listener: BannerAdListener(),
        request: AdRequest())
      ..load();

    // bannerAd!.load();
  }

  void load_intertisial() {
    InterstitialAd.load(
        adUnitId: "ca-app-pub-3940256099942544/1033173712",
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdFailedToLoad: (error) {},
          onAdLoaded: (ad) {
            interads = ad;
          },
        ));
  }

  void load_rewardads() {
    RewardedAd.load(
        adUnitId: "ca-app-pub-3940256099942544/5224354917",
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {},
        ));
  }

  void load_Nativeads()
  {
    nativeAd = NativeAd(
        adUnitId: 'ca-app-pub-3940256099942544/2247696110',
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            nativeAd=ad as NativeAd?;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
          },
        ),
        request:  AdRequest(),

        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.small,
            mainBackgroundColor: Colors.white,
            cornerRadius: 0.0,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: Colors.white,
                backgroundColor: Colors.green.shade700,
                style: NativeTemplateFontStyle.bold,
                size: 20.0),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.white,
                backgroundColor: Colors.blue,
                style: NativeTemplateFontStyle.italic,
                size: 16.0),
            secondaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.green,
                backgroundColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0),
            tertiaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.blue,
                backgroundColor: Colors.amber,
                style: NativeTemplateFontStyle.normal,
                size: 16.0)))
      ..load();
  }
}
