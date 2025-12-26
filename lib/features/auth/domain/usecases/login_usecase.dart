import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/data/models/login_request_model.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class LoginUsecase {
  final AuthRepository authRepository;

  LoginUsecase(this.authRepository);

  Future<ApiResult<User>> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.login(
      LoginRequestModel(email: email, password: password),
    );
  }
}
