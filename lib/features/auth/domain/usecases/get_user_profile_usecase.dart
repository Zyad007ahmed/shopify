import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class GetUserProfileUsecase {
  final AuthRepository authRepository;

  GetUserProfileUsecase(this.authRepository);

  Future<ApiResult<User>> call() async {
    return await authRepository.getProfile();
  }
}
