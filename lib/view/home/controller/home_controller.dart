import 'package:get/get.dart';
import 'package:parity_testing/core/utils/ad_manager.dart';
import 'package:parity_testing/view/home/component/four_view.dart';
import 'package:parity_testing/view/home/component/one_view.dart';
import 'package:parity_testing/view/home/component/three_view.dart';
import 'package:parity_testing/view/home/component/two_view.dart';

class HomeController extends GetxController {
  final AdManager adManager = AdManager();

  @override
  void onInit() {
    super.onInit();
    loadAds();
  }

  void loadAds() {
    adManager.loadAppOpenAd();
    adManager.loadInterstitialAd();
    adManager.loadBannerAd();
    // adManager.loadNativeAd();
    // adManager.listenToAppStateChange();
  }

  @override
  void onClose() {
    super.onClose();
    adManager.bannerAd?.dispose();
  }

  List screen = [
    const OneView(),
    const TwoView(),
    const ThreeView(),
    const FourView(),
  ];
}
