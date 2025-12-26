import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/data/models/login_request_model.dart';
import 'package:shopify/features/auth/data/models/sign_up_request_model.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<ApiResult<User>> login(LoginRequestModel loginRequestModel);
  Future<ApiResult<User>> signUp(SignUpRequestModel signUpRequestModel);
  Future<ApiResult<User>> getProfile();
  Future<ApiResult<void>> logout();
  Future<ApiResult<bool>> isLoggedIn();
  Future<ApiResult<bool>> isEmailAvailable(String email);
}
