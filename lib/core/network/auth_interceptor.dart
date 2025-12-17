import 'package:dio/dio.dart';
import 'package:shopify/core/storage/storage.dart';
import 'package:shopify/core/utils/extensions.dart';

class AuthInterceptor extends Interceptor {
  final Storage _storage;

  AuthInterceptor(this._storage);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.getAccessToken();

    if (token.isNotNullOrEmpty()) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    super.onRequest(options, handler);
  }
}
