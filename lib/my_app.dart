import 'package:flutter/material.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/theme/app_theme.dart';
import 'package:shopify/core/router/router.dart' as router;

class MyApp extends StatelessWidget {
  final bool isFirstLaunch;

  const MyApp({super.key, required this.isFirstLaunch});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(context),
      onGenerateRoute: router.generateRoute,
      initialRoute: isFirstLaunch ? onbordingScreenRoute : logInScreenRoute,
    );
  }
}
