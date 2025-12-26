import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class CheckAuthStatusUsecase {
  final AuthRepository authRepository;

  CheckAuthStatusUsecase(this.authRepository);

  Future<ApiResult<bool>> call() async {
    return await authRepository.isLoggedIn();
  }
}
