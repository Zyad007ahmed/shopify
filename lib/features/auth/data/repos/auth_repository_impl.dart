import 'dart:io';

import 'package:shopify/core/network/api_error_handler.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shopify/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:shopify/features/auth/data/models/login_request_model.dart';
import 'package:shopify/features/auth/data/models/sign_up_request_model.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<ApiResult<User>> login(LoginRequestModel loginRequestModel) async {
    try {
      final tokens = await remoteDataSource.login(loginRequestModel);

      localDataSource.saveTokens(tokens.accessToken, tokens.refreshToken);

      final userModel = await remoteDataSource.getProfile();

      localDataSource.saveUserId(userModel.id);

      return Success(userModel.toEntity());
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<User>> signUp(SignUpRequestModel signUpRequestModel) async {
    try {
      await remoteDataSource.signUp(signUpRequestModel);

      final loginResult = await login(
        LoginRequestModel(
          email: signUpRequestModel.email,
          password: signUpRequestModel.password,
        ),
      );

      return loginResult;
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<User>> getProfile() async {
    try {
      final userModel = await remoteDataSource.getProfile();

      await localDataSource.saveUserId(userModel.id);

      return Success(userModel.toEntity());
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<void>> logout() async {
    try {
      await localDataSource.clearAuthData();
      return Success(null);
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<bool>> isLoggedIn() async {
    try {
      final isLoggedIn = await localDataSource.isLoggedIn();
      return Success(isLoggedIn);
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<bool>> isEmailAvailable(String email) async {
    try {
      final response = await remoteDataSource.isEmailAvailable(
        <String, dynamic>{'email': email},
      );

      final isAvailable = response.isAvailable;

      return Success(isAvailable);
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<User>> updateProfile({
    String? name,
    String? email,
    String? avatar,
  }) async {
    try {
      // Get current user ID from local storage
      final userId = await localDataSource.getCachedUserId();
      if (userId == null) {
        return Failure(
          ErrorHandler.handle(null, message: 'User not logged in'),
        );
      }

      final data = <String, dynamic>{};
      if (name != null) data['name'] = name;
      if (email != null) data['email'] = email;
      if (avatar != null) data['avatar'] = avatar;

      // Update user
      final userModel = await remoteDataSource.updateUser(userId, data);

      // Save updated user
      await localDataSource.saveUserId(userModel.id);

      return Success(userModel.toEntity());
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<String>> uploadAvatar(File imageFile) async {
    try {
      final imageUrl = (await remoteDataSource.uploadFile(imageFile)).location;
      return Success(imageUrl);
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<User>> changePassword(String newPassword) async {
    try {
      // Get current user ID
      final userId = await localDataSource.getCachedUserId();
      if (userId == null) {
        return Failure(
          ErrorHandler.handle(null, message: 'User not logged in'),
        );
      }

      final data = <String, dynamic>{'password': newPassword};

      // Update password
      final userModel = await remoteDataSource.updateUser(userId, data);

      return Success(userModel.toEntity());
    } catch (error) {
      return Failure(ErrorHandler.handle(error));
    }
  }
}
