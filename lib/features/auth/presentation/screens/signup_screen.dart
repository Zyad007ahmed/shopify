import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/theme/app_colors.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:shopify/features/auth/presentation/widgets/signup_dialog.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  SignUpScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  bool? isAgreeForTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/signUp_dark.png",
                height: MediaQuery.of(context).size.height * 0.35,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let’s get started!",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: defaultPadding / 2),
                    const Text(
                      "Please enter your valid data in order to create an account.",
                    ),
                    const SizedBox(height: defaultPadding),
                    SignUpForm(formKey: widget._formKey),
                    const SizedBox(height: defaultPadding),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {
                            setState(() {
                              isAgreeForTerms = value;
                            });
                          },
                          value: isAgreeForTerms,
                        ),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "I agree with the",
                              children: [
                                TextSpan(
                                  text: " Terms of service ",
                                  style: const TextStyle(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(text: "& privacy policy."),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: defaultPadding * 2),
                    ElevatedButton(
                      onPressed: () {
                        if (widget._formKey.currentState!.validate()) {
                          signup(context);
                        }
                      },
                      child: const Text("Continue"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Do you have an account?"),
                        TextButton(
                          onPressed: () {
                            context.pushReplacementNamed(logInScreenRoute);
                          },
                          child: const Text("Log in"),
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

  void signup(BuildContext context) {
    ref.read(authViewModelProvider.notifier).signup();
    _showResultDialog(context);
  }

  Future<dynamic> _showResultDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SignupDialog();
      },
    );
  }
}
