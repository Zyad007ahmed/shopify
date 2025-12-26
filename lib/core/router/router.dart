import 'package:flutter/material.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/entry_point.dart';
import 'package:shopify/features/auth/presentation/screens/login_screen.dart';
import 'package:shopify/features/auth/presentation/screens/signup_screen.dart';
import 'package:shopify/features/home/presentation/screens/home_screen.dart';
import 'package:shopify/features/onboarding/presentation/onbording_screen.dart';

Route? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case onbordingScreenRoute:
      return MaterialPageRoute(builder: (context) => const OnBordingScreen());
    case logInScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case signUpScreenRoute:
      return MaterialPageRoute(builder: (context) => SignUpScreen());
    case entryPointScreenRoute:
      return MaterialPageRoute(builder: (context) => const EntryPoint());
    case homeScreenRoute:
      return MaterialPageRoute(builder: (context) => const HomeScreen());
    default:
      return null;
  }
}
