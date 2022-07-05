import 'package:get/get.dart';
import 'package:ong_animals/core/keys/storage_key.dart';
import 'package:ong_animals/core/packages/contracts/local_storage_service.dart';
import 'package:ong_animals/core/packages/contracts/log_service.dart';
import 'package:ong_animals/features/presenter/routes/routes.dart';

class SettingsController extends GetxController {
  final LocalStorageService _storage;
  final LogService _log;

  SettingsController({
    required LocalStorageService storage,
    required LogService log,
  })  : _storage = storage,
        _log = log;

  Future<void> removeUserData() async {
    await _storage.removeKey(StorageKey.REFRESH_TOKEN_KEY);
    await _storage.removeKey(StorageKey.NAME_KEY);
    _nextPage();
    _log.debug('REMOVIDO A CHAVE: ${StorageKey.REFRESH_TOKEN_KEY}');
    _log.debug('REMOVIDO A CHAVE: ${StorageKey.NAME_KEY}');
  }

  void _nextPage() {
    Get.offAllNamed(Routes.SIGN_IN_PAGE);
  }
}
