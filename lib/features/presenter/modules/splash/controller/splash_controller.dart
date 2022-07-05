import 'package:ong_animals/core/packages/contracts/local_storage_service.dart';
import 'package:ong_animals/features/presenter/routes/routes.dart';
import 'package:ong_animals/core/keys/storage_key.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final LocalStorageService _storage;

  SplashController({required LocalStorageService storage}) : _storage = storage;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_storage.read(StorageKey.REFRESH_TOKEN_KEY) == null ||
          _storage.read(StorageKey.REFRESH_TOKEN_KEY) == '') {
        Get.offNamed(Routes.SIGN_IN_PAGE);
      } else {
        Get.offNamed(Routes.HOME_PAGE);
      }
    });
    super.onReady();
  }
}
