import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/upload_avatar_usecase.dart';
import 'edit_profile_state.dart';

class EditProfileViewModel extends StateNotifier<EditProfileState> {
  final UpdateProfileUseCase updateProfileUseCase;
  final UploadAvatarUseCase uploadAvatarUseCase;
  final Ref ref;

  EditProfileViewModel({
    required this.updateProfileUseCase,
    required this.uploadAvatarUseCase,
    required this.ref,
  }) : super(const EditProfileState.initial());

  Future<void> updateProfile({
    String? name,
    String? email,
    File? avatarFile,
  }) async {
    state = const EditProfileState.loading();

    String? avatarUrl;

    // Upload avatar if provided
    if (avatarFile != null) {
      state = const EditProfileState.uploadingImage();

      final uploadResult = await uploadAvatarUseCase(avatarFile);

      await uploadResult.when(
        failure: (failure) async {
          state = EditProfileState.error(failure.message!);
        },
        success: (url) async {
          avatarUrl = url;
        },
      );

      // If upload failed, stop
      if (state is EditProfileError) return;
    }

    // Update profile
    final result = await updateProfileUseCase(
      name: name,
      email: email,
      avatar: avatarUrl,
    );

    result.when(
      failure: (failure) => state = EditProfileState.error(failure.message!),
      success: (user) {
        state = const EditProfileState.success('Profile updated successfully');
      },
    );
  }
}
