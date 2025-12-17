import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shopify/core/constants/api_constants.dart';
import 'package:shopify/core/network/auth_interceptor.dart';
import 'package:shopify/core/storage/storage.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio(Storage storage) {
    if (_dio == null) {
      _dio = Dio();
      _dio!
        ..options.baseUrl = ApiConstants.baseUrl
        ..options.connectTimeout = ApiConstants.connectTimeout
        ..options.receiveTimeout = ApiConstants.receiveTimeout
        ..options.sendTimeout = ApiConstants.sendTimeout;
      _addDioHeaders();
      _addDioInceptors(storage);
    }

    return _dio!;
  }

  static void _addDioHeaders() {
    _dio?.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  static void _addDioInceptors(Storage storage) {
    _dio?.interceptors.addAll([
      AuthInterceptor(storage),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
      ),
    ]);
  }
}
