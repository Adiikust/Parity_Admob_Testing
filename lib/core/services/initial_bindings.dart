import 'package:get/get.dart';
import 'package:parity_testing/view/home/controller/home_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => AuthController.instance, fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
  }
}
