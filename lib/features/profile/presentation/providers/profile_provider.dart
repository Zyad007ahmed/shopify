import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/profile/presentation/viewmodels/change_password_viewmodel/change_password_state.dart';
import 'package:shopify/features/profile/presentation/viewmodels/change_password_viewmodel/change_password_viewmodel.dart';
import 'package:shopify/features/profile/presentation/viewmodels/edit_profile_viewmodel/edit_profile_state.dart';
import 'package:shopify/features/profile/presentation/viewmodels/edit_profile_viewmodel/edit_profile_viewmodel.dart';

// VIEWMODEL PROVIDERS

final editProfileViewModelProvider =
    StateNotifierProvider.autoDispose<EditProfileViewModel, EditProfileState>((
      ref,
    ) {
      return EditProfileViewModel(
        updateProfileUseCase: ref.watch(updateProfileUseCaseProvider),
        uploadAvatarUseCase: ref.watch(uploadAvatarUseCaseProvider),
        ref: ref,
      );
    });

final changePasswordViewModelProvider =
    StateNotifierProvider.autoDispose<
      ChangePasswordViewModel,
      ChangePasswordState
    >((ref) {
      return ChangePasswordViewModel(
        changePasswordUseCase: ref.watch(changePasswordUseCaseProvider),
      );
    });

// HELPER PROVIDERS

// Get current user (from auth)
final currentUserProvider = Provider((ref) {
  return ref.watch(authViewModelProvider.notifier).currentUser;
});
