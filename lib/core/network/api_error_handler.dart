import 'package:dio/dio.dart';
import 'package:shopify/core/error/exceptions.dart';

import 'error_model.dart';

class ErrorHandler {
  static ErrorModel handle(dynamic error) {
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ErrorModel(message: "Connection to server failed");
        case DioExceptionType.cancel:
          return ErrorModel(message: "Request to the server was cancelled");
        case DioExceptionType.connectionTimeout:
          return ErrorModel(message: "Connection timeout with the server");
        case DioExceptionType.unknown:
          return ErrorModel(
            message:
                "Connection to the server failed due to internet connection",
          );
        case DioExceptionType.receiveTimeout:
          return ErrorModel(
            message: "Receive timeout in connection with the server",
          );
        case DioExceptionType.badResponse:
          return _handleError(error.response?.data);
        case DioExceptionType.sendTimeout:
          return ErrorModel(
            message: "Send timeout in connection with the server",
          );
        default:
          return ErrorModel(message: "Something went wrong");
      }
    } else if (error.type is CacheException) {
      return ErrorModel(message: (error.type as CacheException).message);
    } else {
      return ErrorModel(message: "Unknown error occurred");
    }
  }
}

ErrorModel _handleError(dynamic data) {
  return ErrorModel(
    message: getMessageString(data) ?? "Unknown error occurred",
    error: data['error'],
    code: data['statusCode'],
  );
}

String? getMessageString(data) {
  if (data['message'] is List) {
    return (data['message'] as List).join('\n');
  } else {
    return data['message'];
  }
}
