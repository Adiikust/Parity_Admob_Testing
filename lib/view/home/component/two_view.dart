import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parity_testing/core/constants/constants.dart';
import 'package:parity_testing/core/utils/ad_manager.dart';
import 'package:parity_testing/view/home/controller/home_controller.dart';

class TwoView extends StatefulWidget {
  const TwoView({super.key});

  @override
  State<TwoView> createState() => _TwoViewState();
}

class _TwoViewState extends State<TwoView> {
  final AdManager adManager = AdManager();

  @override
  void initState() {
    super.initState();
    adManager.loadCollapsibleBannerAd();
  }

  @override
  void dispose() {
    super.dispose();
    adManager.collapsibleBannerAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Two"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text("Two View"),
        ),
      ),
      bottomNavigationBar: Obx(
        () {
          return adManager.isCollapsibleBannerAdLoaded.value == true
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.red,
                    width: adManager.collapsibleBannerAd?.size.width.toDouble(),
                    height:
                        adManager.collapsibleBannerAd?.size.height.toDouble(),
                    child: AdWidget(ad: adManager.collapsibleBannerAd!),
                  ),
                )
              : Container(
                  height: 50,
                  width: double.maxFinite,
                  color: Colors.red,
                );
        },
      ),
    );
  }
}
