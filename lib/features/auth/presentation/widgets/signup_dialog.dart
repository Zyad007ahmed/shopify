import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/auth/presentation/viewmodels/auth_state.dart';

class SignupDialog extends ConsumerWidget {
  const SignupDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authViewModelProvider);

    return state.maybeWhen(
      loading: () => loadingDialog(),
      error: (message) => errorLoginDialog(message, context),
      authenticated: (user) => signedupSuccessfully(context, user),
      orElse: () {
        return SizedBox.shrink();
      },
    );
  }

  Widget loadingDialog() {
    return AlertDialog(
      content: SizedBox(
        height: 150,
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget errorLoginDialog(message, BuildContext context) {
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

  //todo
  navigateToEntryPoint(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      entryPointScreenRoute,
      (Route<dynamic> route) => false,
    );
  }

  Widget signedupSuccessfully(BuildContext context, User user) {
    return AlertDialog(
      title: Text(
        '${AppStrings.welcome} ${user.name}',
        style: TextStyle(color: Colors.blueAccent),
      ),
      content: Text(AppStrings.signedupSuccessfully),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(AppStrings.letsGo),
        ),
      ],
    );
  }
}
