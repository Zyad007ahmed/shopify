import 'package:shopify/core/network/api_error_handler.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class UpdateProfileUseCase {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<ApiResult<User>> call({
    String? name,
    String? email,
    String? avatar,
  }) async {
    // Validation
    if (name != null && name.isEmpty) name = null;
    if (email != null && email.isEmpty) email = null;

    if (name != null && name.trim().length < 2) {
      return Failure(
        ErrorHandler.handle(
          null,
          message: 'Name must be at least 2 characters',
        ),
      );
    }

    if (email != null) {
      bool isEmailAvailable = false;
      (await repository.isEmailAvailable(
        email,
      )).whenOrNull(success: (data) => isEmailAvailable = data);

      if (isEmailAvailable) {
        return Failure(
          ErrorHandler.handle(null, message: 'Please enter a valid email'),
        );
      }
    }

    return await repository.updateProfile(
      name: name?.trim(),
      email: email?.trim(),
      avatar: avatar,
    );
  }
}
