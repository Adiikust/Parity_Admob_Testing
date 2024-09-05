import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parity_testing/view/home/controller/home_controller.dart';

class ThreeView extends GetView<HomeController> {
  const ThreeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Three")),
      body: Center(
        child: TextButton(
          onPressed: () {},
          child: const Text("Three View"),
        ),
      ),
    );
  }
}
