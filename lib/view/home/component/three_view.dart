import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parity_testing/core/utils/ad_manager.dart';

class ThreeView extends StatefulWidget {
  const ThreeView({super.key});

  @override
  State<ThreeView> createState() => _ThreeViewState();
}

class _ThreeViewState extends State<ThreeView> {
  final AdManager adManager = AdManager();

  @override
  void initState() {
    super.initState();
    adManager.loadNativeAd(templateType: TemplateType.medium);
  }

  @override
  void dispose() {
    super.dispose();
    adManager.nativeAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Three")),
      body: Center(
        child: TextButton(
          onPressed: () {
            AdWidget(ad: adManager.nativeAd!);
          },
          child: const Text("show Native Ads View"),
        ),
      ),
    );
  }
}
