abstract class KeyValueStorageService {
  Future<void> setKeyValue<T>({
    required String key,
    required T value,
  });
  Future<T?> getKeyValue<T>({
    required String key,
  });
  Future<bool> removeKey(String key);
}
