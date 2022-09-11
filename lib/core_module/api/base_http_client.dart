import 'package:dio/dio.dart';

import '../error_handling/core_exception.dart';

abstract class IBaseHttpClient {
  Future<Response<dynamic>> getAsync(String routeName);
}

class BaseHttpClient implements IBaseHttpClient {
  static const String _baseUrl = "https://desafio-mobile.nyc3.digitaloceanspaces.com/movies-v2";

  @override
  Future<Response<dynamic>> getAsync(String routeName) async {
    try {
      var response = await Dio().get(_baseUrl + routeName);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw GetBadRequisitionException(StackTrace.current, 'BadRequisition.GET', Exception('Status code != 200'));
      }
    } catch (exception, stacktrace) {
      throw GetBadRequisitionException(stacktrace, 'BadRequisition.GET', exception);
    }
  }
}
