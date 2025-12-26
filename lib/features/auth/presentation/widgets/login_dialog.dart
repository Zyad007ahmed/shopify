import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/auth/presentation/viewmodels/auth_state.dart';

class LoginDialog extends ConsumerWidget {
  const LoginDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    listenForAuthenticationSuccess(context, ref);

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

  Widget _errorLoginDialog(message, BuildContext context) {
    return AlertDialog(
      title: Text(
        AppStrings.loginFailed,
        style: TextStyle(color: Colors.redAccent),
      ),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(AppStrings.gotIt),
        ),
      ],
    );
  }

  navigateToEntryPoint(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      entryPointScreenRoute,
      (Route<dynamic> route) => false,
    );
  }

  void listenForAuthenticationSuccess(BuildContext context, WidgetRef ref) {
    ref.listen(authViewModelProvider, (_, state) {
      state.maybeWhen(
        authenticated: (user) {
          navigateToEntryPoint(context);
        },
        orElse: () {},
      );
    });
  }
}
