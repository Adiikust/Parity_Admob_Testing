import 'dart:io';

import 'package:flutter/foundation.dart';

class AdHelper {
  /// Get banner ad unit id
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      //true = testing ids
      //false = release ids
      return kDebugMode ? "ca-app-pub-3940256099942544/6300978111" : "";
    } else if (Platform.isIOS) {
      return kDebugMode ? "ca-app-pub-3940256099942544/2934735716" : "";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  /// Get Interstitial ad unit id
  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode ? "ca-app-pub-3940256099942544/8691691433" : "";
    } else if (Platform.isIOS) {
      return kDebugMode ? "ca-app-pub-3940256099942544/5135589807" : "";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  /// Get Rewarded interstitial ad unit id
  static String get rewardedInterstitialAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode ? "ca-app-pub-3940256099942544/5354046379" : "";
    } else if (Platform.isIOS) {
      return kDebugMode ? "ca-app-pub-3940256099942544/6978759866" : "";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  /// Get Rewarded ad unit id
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode ? "ca-app-pub-3940256099942544/5224354917" : "";
    } else if (Platform.isIOS) {
      return kDebugMode ? "ca-app-pub-3940256099942544/1712485313" : "";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  /// Get Native advanced ad unit id
  static String get nativeAdvancedAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode ? "ca-app-pub-3940256099942544/2247696110" : "";
    } else if (Platform.isIOS) {
      return kDebugMode ? "ca-app-pub-3940256099942544/3986624511" : "";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  /// Get App open ad unit id
  static String get appOpenAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/9257395921";
    } else if (Platform.isIOS) {
      return kDebugMode ? "ca-app-pub-3940256099942544/5662855259" : "";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
