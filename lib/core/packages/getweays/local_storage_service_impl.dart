import 'package:ong_animals/core/packages/contracts/local_storage_service.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  final GetStorage _storage = GetStorage();
  @override
  dynamic read(String key) {
    return _storage.read(key);
  }

  @override
  Future<void> removeKey(String key) async {
    await _storage.remove(key);
  }

  @override
  Future<void> write({required String key, required value}) async {
    await _storage.write(key, value);
  }
}
