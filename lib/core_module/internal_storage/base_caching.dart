import 'dart:io';
import 'dart:typed_data';

import 'package:hive/hive.dart';

import '../error_handling/core_exception.dart';
import '../error_handling/core_success.dart';

abstract class IBaseCaching {
  Future<String> getFromCache(String key);
  Future<CoreSuccess> saveToCache({required String key, required String value});
}

class BaseCaching implements IBaseCaching {
  final _box = Hive.box('moviesBox');

  @override
  Future<String> getFromCache(String key) async {
    try {
      final String result = await _box.get(key);
      return result;
    } catch (exception, stacktrace) {
      throw GetFromCacheException(stacktrace, 'GET FROM HIVE', exception);
    }
  }

  @override
  Future<CoreSuccess> saveToCache({required String key, required String value}) async {
    try {
      await _box.put(key, value);
      return SaveToCacheSuccess();
    } catch (exception, stacktrace) {
      throw SaveToCacheException(stacktrace, 'SAVE TO HIVE', exception);
    }
  }
}
