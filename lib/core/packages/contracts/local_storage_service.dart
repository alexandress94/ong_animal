abstract class LocalStorageService {
  Future<void> write({required String key, required dynamic value});
  dynamic read(String key);
  Future<void> removeKey(String key);
}
