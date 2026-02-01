import 'package:shopify/core/network/api_error_handler.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class ChangePasswordUseCase {
  final AuthRepository repository;

  ChangePasswordUseCase(this.repository);

  Future<ApiResult<User>> call(String newPassword) async {
    // Validation
    if (newPassword.isEmpty) {
      return Failure(
        ErrorHandler.handle(null, message: 'Password cannot be empty'),
      );
    }

    if (newPassword.length < 4) {
      return Failure(
        ErrorHandler.handle(
          null,
          message: 'Password must be at least 4 characters',
        ),
      );
    }

    return await repository.changePassword(newPassword);
  }
}
