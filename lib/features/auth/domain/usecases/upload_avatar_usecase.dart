import 'dart:io';

import 'package:shopify/core/network/api_error_handler.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';

class UploadAvatarUseCase {
  final AuthRepository repository;

  UploadAvatarUseCase(this.repository);

  Future<ApiResult<String>> call(File imageFile) async {
    // Validation
    if (!imageFile.existsSync()) {
      return Failure(
        ErrorHandler.handle(null, message: 'Image file does not exist'),
      );
    }

    // Check file size (max 5MB)
    final fileSize = imageFile.lengthSync();
    if (fileSize > 5 * 1024 * 1024) {
      return Failure(
        ErrorHandler.handle(null, message: 'Image size must be less than 5MB'),
      );
    }

    return await repository.uploadAvatar(imageFile);
  }
}
