import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parity_testing/core/utils/ad_manager.dart';

class OneView extends StatefulWidget {
  const OneView({super.key});

  @override
  State<OneView> createState() => _OneViewState();
}

class _OneViewState extends State<OneView> {
  final AdManager adManager = AdManager();

  @override
  void initState() {
    super.initState();
    adManager.loadNativeAd(templateType: TemplateType.small);
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
      appBar: AppBar(
        title: const Text("One"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text("One View"),
        ),
      ),
      bottomNavigationBar: Obx(
        () => adManager.isNativeLoad.value == true
            ? Container(
                decoration: const BoxDecoration(color: Colors.red
                    // gradient: LinearGradient(
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomLeft,
                    //   colors: [
                    //     Color(0xfffd6c0b),
                    //     // MyColorConstants.appColor,
                    //     // MyColorConstants.appColor,
                    //   ],
                    // ),
                    ),
                //360
                height: MediaQuery.sizeOf(context).height * 0.15,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: AdWidget(ad: adManager.nativeAd!))
            : const SizedBox(),
      ),
    );
  }
}
