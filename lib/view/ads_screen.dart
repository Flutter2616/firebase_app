import 'package:firebaseapp/utils/adshelper.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

class Adsscreen extends StatefulWidget {
  const Adsscreen({super.key});

  @override
  State<Adsscreen> createState() => _AdsscreenState();
}

class _AdsscreenState extends State<Adsscreen> {
  @override
  void initState() {
    super.initState();
    Adshelper.adshelper.load_Bannerad();
    Adshelper.adshelper.load_intertisial();
    Adshelper.adshelper.load_rewardads();
    Adshelper.adshelper.load_Nativeads();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Google Ads")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 20.h,
                  child: AdWidget(ad: Adshelper.adshelper.bannerAd!)),
              ElevatedButton(
                  onPressed: () {
                    if (Adshelper.adshelper.interads != null) {
                      Adshelper.adshelper.interads!.show();
                      Adshelper.adshelper.load_intertisial();
                    }
                  },
                  child: Text("intertisial ads")),
              ElevatedButton(
                  onPressed: () {
                    if (Adshelper.adshelper.rewardedAd != null) {
                      Adshelper.adshelper.rewardedAd!.show(onUserEarnedReward:
                          (AdWithoutView ad, RewardItem reward) {
                        print("reward:==${reward.amount}");
                      });
                      Adshelper.adshelper.load_rewardads();
                    }
                  },
                  child: Text("reward ads")),
              SizedBox(
                  height: 40.h,
                  child: AdWidget(ad: Adshelper.adshelper.nativeAd!)),
            ],
          ),
        ),
      ),
    );
  }
}
