import 'package:flutter/material.dart';
import 'package:shopify/core/constants/app_strings.dart';
import 'package:shopify/core/utils/extensions.dart';

class ErrorDialog extends StatelessWidget {
  final String title;
  final String message;

  const ErrorDialog({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, style: TextStyle(color: Colors.redAccent)),
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
}
