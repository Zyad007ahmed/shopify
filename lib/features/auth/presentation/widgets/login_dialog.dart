import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/widgets/error_dialog.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/auth/presentation/viewmodels/auth_state.dart';

class LoginDialog extends ConsumerWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authViewModelProvider);

    return state.maybeWhen(
      loading: () => _loadingDialog(),
      error: (message) => _errorLoginDialog(message, context),
      orElse: () {
        return SizedBox.shrink();
      },
    );
  }

  Widget _loadingDialog() {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _errorLoginDialog(String message, BuildContext context) {
    return ErrorDialog(title: AppStrings.loginFailed, message: message);
  }
}
