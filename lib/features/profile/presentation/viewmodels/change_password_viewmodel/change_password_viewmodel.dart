import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/usecases/change_password_usecase.dart';
import 'change_password_state.dart';

class ChangePasswordViewModel extends StateNotifier<ChangePasswordState> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordViewModel({required this.changePasswordUseCase})
    : super(const ChangePasswordState.initial());

  Future<void> changePassword(
    String newPassword,
    String confirmPassword,
  ) async {
    // Validation
    if (newPassword != confirmPassword) {
      state = const ChangePasswordState.error('Passwords do not match');
      return;
    }

    state = const ChangePasswordState.loading();

    final result = await changePasswordUseCase(newPassword);

    result.when(
      failure: (failure) => state = ChangePasswordState.error(failure.message!),
      success: (user) => state = const ChangePasswordState.success(
        'Password changed successfully',
      ),
    );
  }
}
