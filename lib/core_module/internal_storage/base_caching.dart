import 'package:hive/hive.dart';

import '../error_handling/core_exception.dart';
import '../error_handling/core_success.dart';

class BaseCaching {
  static final _box = Hive.box('moviesBox');

  String getFromCache(String key) {
    try {
      final String result = _box.get(key);
      return result;
    } catch (exception, stacktrace) {
      throw GetFromCacheException(stacktrace, 'GET FROM HIVE', exception);
    }
  }

  Future<CoreSuccess> saveToCache({required String key, required String value}) async {
    try {
      await _box.put(key, value);
      return SaveToCacheSuccess();
    } catch (exception, stacktrace) {
      throw SaveToCacheException(stacktrace, 'SAVE TO HIVE', exception);
    }
  }
}
