import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parity_testing/core/constants/constants.dart';
import 'package:parity_testing/view/home/controller/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
              onPressed: () {
                controller.adManager.showAppOpenAd();
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: Constants.admob.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                controller.adManager.showInterstitialAd();
                Get.to(controller.screen[index]);
              },
              child: Container(
                alignment: Alignment.center,
                color: Colors.brown,
                child: Text(
                  Constants.admob[index],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      ),
      persistentFooterButtons: [
        Obx(
          () {
            return controller.adManager.isBottomBannerAdLoaded.value == true
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.red,
                      width:
                          controller.adManager.bannerAd?.size.width.toDouble(),
                      height:
                          controller.adManager.bannerAd?.size.height.toDouble(),
                      child: AdWidget(ad: controller.adManager.bannerAd!),
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
