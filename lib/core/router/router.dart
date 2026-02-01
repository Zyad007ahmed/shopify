import 'package:flutter/material.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/entry_point.dart';
import 'package:shopify/features/auth/presentation/screens/login_screen.dart';
import 'package:shopify/features/auth/presentation/screens/signup_screen.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/presentation/screens/category_screen.dart';
import 'package:shopify/features/home/presentation/screens/home_screen.dart';
import 'package:shopify/features/onboarding/presentation/onbording_screen.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/presentation/screens/product_details_screen.dart';
import 'package:shopify/features/profile/presentation/screens/change_password_screen.dart';
import 'package:shopify/features/profile/presentation/screens/edit_profile_screen.dart';

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
    case editProfileScreenRoute:
      return MaterialPageRoute(builder: (context) => const EditProfileScreen());
    case changePasswordScreenRoute:
      return MaterialPageRoute(
        builder: (context) => const ChangePasswordScreen(),
      );
    case productDetailsScreenRoute:
      return MaterialPageRoute(
        builder: (context) =>
            ProductDetailsScreen(product: settings.arguments as Product),
      );
    case categoryProductsScreenRoute:
      return MaterialPageRoute(
        builder: (context) =>
            CategoryScreen(category: settings.arguments as Category),
      );
    default:
      return null;
  }
}
