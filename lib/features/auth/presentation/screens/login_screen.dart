import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/auth/presentation/widgets/login_dialog.dart';
import 'package:shopify/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/login_dark.png", fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome back!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Log in with your data that you intered during your registration.",
                    ),
                    const SizedBox(height: defaultPadding),
                    LogInForm(formKey: _formKey),
                    Align(
                      child: TextButton(
                        child: const Text("Forgot password"),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: size.height > 700
                          ? size.height * 0.1
                          : defaultPadding,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          login(context, ref);
                        }
                      },
                      child: const Text("Log in"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(signUpScreenRoute);
                          },
                          child: const Text("Sign up"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login(BuildContext context, WidgetRef ref) {
    ref.read(authViewModelProvider.notifier).login();
    _showResultDialog(context);
  }

  Future<dynamic> _showResultDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return LoginDialog();
      },
    );
  }
}
