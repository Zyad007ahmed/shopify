import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:shopify/core/constants/api_constants.dart';
import 'package:shopify/features/auth/data/models/email_availablity_response_model.dart';
import 'package:shopify/features/auth/data/models/login_request_model.dart';
import 'package:shopify/features/auth/data/models/sign_up_request_model.dart';
import 'package:shopify/features/auth/data/models/token_model.dart';
import 'package:shopify/features/auth/data/models/user_model.dart';

part 'auth_remote_data_source.g.dart';

abstract class AuthRemoteDataSource {
  Future<TokenModel> login(LoginRequestModel loginRequestModel);
  Future<UserModel> signUp(SignUpRequestModel signUpRequestModel);
  Future<UserModel> getProfile();
  Future<EmailAvailablityResponseModel> isEmailAvailable(
    Map<String, dynamic> email,
  );
  Future<TokenModel> refreshToken(Map<String, dynamic> refreshToken);
}

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  factory AuthRemoteDataSourceImpl(Dio dio, {String baseUrl}) =
      _AuthRemoteDataSourceImpl;

  // login
  @override
  @POST(ApiConstants.authLoginEP)
  Future<TokenModel> login(@Body() LoginRequestModel loginRequestModel);

  // signup
  @override
  @POST(ApiConstants.usersEP)
  Future<UserModel> signUp(@Body() SignUpRequestModel signUpRequestModel);

  // get user profile
  @override
  @GET(ApiConstants.authProfileEP)
  Future<UserModel> getProfile();

  // Check if email is available
  @override
  @POST(ApiConstants.isUserAvaiilableEP)
  Future<EmailAvailablityResponseModel> isEmailAvailable(
    @Body() Map<String, dynamic> email,
  );

  // refresh token
  @override
  @POST(ApiConstants.authRefreshEP)
  Future<TokenModel> refreshToken(@Body() Map<String, dynamic> refreshToken);
}
