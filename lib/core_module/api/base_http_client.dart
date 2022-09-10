import 'package:dio/dio.dart';

import '../error_handling/core_exception.dart';

class BaseHttpClient {
  static const String _baseUrl = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies-v2";

  Future<Object> getAsync(String routeName) async {
    try {
      var response = await Dio().get(_baseUrl + routeName);
      if (response.statusCode == 200) {
        return response;
      } else {
        return GetBadRequisitionException(StackTrace.current, 'BadRequisition.GET', Exception('Status code != 200'));
      }
    } catch (exception, stacktrace) {
      throw GetBadRequisitionException(stacktrace, 'BadRequisition.GET', exception);
    }
  }
}
