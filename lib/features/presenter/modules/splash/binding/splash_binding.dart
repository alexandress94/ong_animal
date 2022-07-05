import 'package:ong_animals/features/presenter/modules/splash/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SplashController(storage: Get.find()),
    );
  }
}
