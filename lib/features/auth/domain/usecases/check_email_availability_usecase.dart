import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class CheckEmailAvailabilityUsecase {
  final AuthRepository authRepository;

  CheckEmailAvailabilityUsecase(this.authRepository);

  Future<ApiResult<bool>> call({required String email}) async {
    return await authRepository.isEmailAvailable(email);
  }
}
