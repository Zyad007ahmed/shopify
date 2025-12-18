import 'package:flutter/material.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/features/onboarding/presentation/onbording_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onbordingScreenRoute:
      return MaterialPageRoute(builder: (context) => const OnBordingScreen());
    case logInScreenRoute:
      return MaterialPageRoute(builder: (context) => const OnBordingScreen());
    default:
      return null;
  }
}
