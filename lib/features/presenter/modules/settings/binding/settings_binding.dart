import 'package:get/get.dart';
import 'package:ong_animals/core/packages/getweays/log_service_impl.dart';
import 'package:ong_animals/features/presenter/modules/settings/controller/settings_controller.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SettingsController(
        storage: Get.find(),
        log: LogServiceImpl(),
      ),
    );
  }
}
