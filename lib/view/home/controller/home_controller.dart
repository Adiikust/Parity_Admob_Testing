import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parity_testing/core/utils/ad_manager.dart';
import 'package:parity_testing/view/home/component/four_view.dart';
import 'package:parity_testing/view/home/component/one_view.dart';
import 'package:parity_testing/view/home/component/three_view.dart';
import 'package:parity_testing/view/home/component/two_view.dart';

class HomeController extends GetxController with WidgetsBindingObserver {
  final AdManager adManager = AdManager();
  bool isAppInForeground = false;

  @override
  void onInit() {
    super.onInit();
    loadAds();
    WidgetsBinding.instance.addObserver(this);
  }

  void loadAds() {
    adManager.loadAppOpenAd();
    adManager.loadInterstitialAd();
    adManager.loadBannerAd();
    // adManager.loadNativeAd();
  }

  @override
  void onClose() {
    super.onClose();
    adManager.bannerAd?.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && isAppInForeground == false) {
      isAppInForeground = true;
      adManager.showAppOpenAd();
    } else if (state == AppLifecycleState.paused) {
      isAppInForeground = false;
    }
  }

  List screen = [
    const OneView(),
    const TwoView(),
    const ThreeView(),
    const FourView(),
  ];
}
