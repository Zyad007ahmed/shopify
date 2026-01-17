import 'package:shopify/core/network/api_error_handler.dart';
import 'package:shopify/core/network/api_result.dart';

Future<ApiResult<T>> tryAndHandleError<T>(Function call) async {
  try {
    return Success(await call());
  } catch (error) {
    return Failure(ErrorHandler.handle(error));
  }
}
