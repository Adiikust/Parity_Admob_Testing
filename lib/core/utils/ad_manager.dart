import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parity_testing/core/utils/ad_helper.dart';

class AdManager {
  RxBool isBottomBannerAdLoaded = false.obs;
  RxBool isInterstitialAdLoaded = false.obs;
  RxBool isCollapsibleBannerAdLoaded = false.obs;
  RxBool isNativeLoad = false.obs;
  RxBool isAppOpenAd = false.obs;
  AppOpenAd? _appOpenAd;
  InterstitialAd? _interstitialAd;
  BannerAd? bannerAd;
  BannerAd? collapsibleBannerAd;
  NativeAd? nativeAd;

  Future<void> loadAppOpenAd() async {
    await AppOpenAd.load(
      adUnitId: AdHelper.appOpenAdUnitId,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('###################################### $ad');
        print('open app Ad loaded');
        isAppOpenAd.value = true;
        _appOpenAd = ad;
      }, onAdFailedToLoad: (error) {
        print('######################################$error');
        print('open app failed to load ad: $error');
      }),
    );
  }

  // void openAppAdCallback() {
  //   _appOpenAd?.fullScreenContentCallback = FullScreenContentCallback(
  //     onAdDismissedFullScreenContent: (ad) {
  //       _appOpenAd?.dispose();
  //       _appOpenAd = null;
  //       loadAppOpenAd();
  //     },
  //   );
  // }

  Future<void> showAppOpenAd() async {
    if (isAppOpenAd.value && _appOpenAd != null) {
      _appOpenAd?.show();
      _appOpenAd?.dispose();
      isAppOpenAd.value = false;
      _appOpenAd = null;
      loadAppOpenAd();
    }
  }

  Future<void> loadBannerAd() async {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("Banner Ad loaded");
          bannerAd = ad as BannerAd?;
          isBottomBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("Banner failed to load ad: $error");
        },
      ),
      request: const AdRequest(),
    ).load();
    // _bottomBannerAd!.load();
  }

  Future<void> loadCollapsibleBannerAd() async {
    BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          print("collapsible Banner Ad loaded");
          collapsibleBannerAd = ad as BannerAd?;
          isCollapsibleBannerAdLoaded.value = true;
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print("collapsible Banner failed to load ad: $error");
        },
      ),

      ///Note: collapsible user for direction
      request: const AdRequest(extras: {"collapsible": "bottom"}),
    ).load();
    // _bottomBannerAd!.load();
  }

  Future<void> loadNativeAd({required TemplateType templateType}) async {
    try {
      NativeAd(
        adUnitId: AdHelper.nativeAdvancedAdUnitId,

        ///Note: factoryId user for custom native ads
        //factoryId: ,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            print("Native Ad loaded");
            nativeAd = ad as NativeAd?;
            isNativeLoad.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            ad.dispose();
            print("Native failed to load ad: $error");
          },
        ),
        request: const AdRequest(),

        ///Note: TemplateType use for default ads view
        nativeTemplateStyle: NativeTemplateStyle(templateType: templateType),
      ).load();
    } catch (e) {
      log(e.toString());
    }
  }

  ///
  Future<void> loadInterstitialAd() async {
    try {
      InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print("Interstitial Ad loaded");
            _interstitialAd = ad;
            _interstitialAd!.fullScreenContentCallback =
                FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {},
              onAdShowedFullScreenContent: (ad) {},
              onAdFailedToShowFullScreenContent:
                  (InterstitialAd ad, AdError error) {
                print('Ad failed to show: $error');
                ad.dispose();
                _interstitialAd = null;
                loadInterstitialAd();
              },
            );
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
            _interstitialAd = null;
          },
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }

  interstitialAdCallback() {
    _interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {},
      onAdDismissedFullScreenContent: (ad) {
        print("Interstitial Ad closed");
        ad.dispose();
        _interstitialAd = null;
        loadInterstitialAd();
      },
    );
  }

  Future<void> showInterstitialAd() async {
    if (_interstitialAd != null) {
      interstitialAdCallback();
      _interstitialAd!.show();
    } else {
      loadInterstitialAd();
    }
  }

  /// App State
  // void listenToAppStateChange() {
  //   AppStateEventNotifier.stopListening();
  //   AppStateEventNotifier.appStateStream
  //       .forEach((element) => onAppStateChange(element));
  // }
  //
  // void onAppStateChange(AppState appState) {
  //   if (appState == AppState.foreground) {
  //     if (_appOpenAd != null) {
  //       print("show app open ad");
  //       print("%%%%%%%%%%%%%$appState");
  //       showAppOpenAd();
  //     } else {
  //       print("show app load ad");
  //       print("&&&&&&&&&&&&&&&&&&$appState");
  //       loadAppOpenAd();
  //     }
  //   } else {
  //     print("show app load ad");
  //     print("################$appState");
  //     loadAppOpenAd();
  //   }
  // }
}
