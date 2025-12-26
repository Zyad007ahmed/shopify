import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class LogoutUsecase {
  final AuthRepository authRepository;

  LogoutUsecase(this.authRepository);

  Future<ApiResult<void>> call() async {
    return await authRepository.logout();
  }
}
