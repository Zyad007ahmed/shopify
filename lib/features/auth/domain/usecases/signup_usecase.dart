import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/data/models/sign_up_request_model.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class SignupUsecase {
  final AuthRepository authRepository;

  SignupUsecase(this.authRepository);

  Future<ApiResult<User>> call({
    required String name,
    required String email,
    required String password,
    required String avatar,
  }) async {
    return await authRepository.signUp(
      SignUpRequestModel(
        name: name,
        email: email,
        password: password,
        avatar: avatar,
      ),
    );
  }
}
