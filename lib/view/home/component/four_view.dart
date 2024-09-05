import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parity_testing/core/utils/ad_manager.dart';

class FourView extends StatefulWidget {
  const FourView({super.key});

  @override
  State<FourView> createState() => _FourViewState();
}

class _FourViewState extends State<FourView> {
  final AdManager adManager = AdManager();

  @override
  void initState() {
    super.initState();
    adManager.loadBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    adManager.bannerAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Four"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text("Four View"),
        ),
      ),
      persistentFooterButtons: [
        Obx(
          () {
            return adManager.isBottomBannerAdLoaded.value == true
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.red,
                      width: adManager.bannerAd?.size.width.toDouble(),
                      height: adManager.bannerAd?.size.height.toDouble(),
                      child: AdWidget(ad: adManager.bannerAd!),
                    ),
                  )
                : Container(
                    height: 50,
                    width: double.maxFinite,
                    color: Colors.red,
                  );
          },
        )
      ],
    );
  }
}
