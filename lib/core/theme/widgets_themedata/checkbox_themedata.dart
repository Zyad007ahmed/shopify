import 'package:flutter/material.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/theme/app_colors.dart';

CheckboxThemeData checkboxThemeData = CheckboxThemeData(
  checkColor: WidgetStateProperty.all(Colors.white),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadious / 2)),
  ),
  side: const BorderSide(color: AppColors.whileColor40),
);
