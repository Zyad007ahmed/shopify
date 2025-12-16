import 'package:flutter/material.dart';
import 'package:shopify/core/theme/app_colors.dart';
import 'package:shopify/core/theme/widgets_themedata/button_theme.dart';
import 'package:shopify/core/theme/widgets_themedata/input_decoration_theme.dart';

import 'widgets_themedata/checkbox_themedata.dart';
import 'widgets_themedata/theme_data.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
      fontFamily: "Plus Jakarta",
      primarySwatch: AppColors.primaryMaterialColor,
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: AppColors.blackColor),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: AppColors.blackColor40),
      ),
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
      outlinedButtonTheme: outlinedButtonTheme(),
      inputDecorationTheme: lightInputDecorationTheme,
      checkboxTheme: checkboxThemeData.copyWith(
        side: const BorderSide(color: AppColors.blackColor40),
      ),
      appBarTheme: appBarLightTheme,
      scrollbarTheme: scrollbarThemeData,
      dataTableTheme: dataTableLightThemeData,
    );
  }
}
