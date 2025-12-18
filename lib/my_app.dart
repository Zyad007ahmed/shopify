import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/theme/app_theme.dart';
import 'package:shopify/core/router/router.dart' as router;

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Shopify',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(context),
      onGenerateRoute: router.generateRoute,
      initialRoute: onbordingScreenRoute,
    );
  }
}
