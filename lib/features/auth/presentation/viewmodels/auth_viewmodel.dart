import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/check_email_availability_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/signup_usecase.dart';
import 'package:shopify/features/auth/presentation/viewmodels/auth_state.dart';

class AuthViewmodel extends StateNotifier<AuthState> {
  final LoginUsecase loginUsecase;
  final SignupUsecase signupUsecase;
  final LogoutUsecase logoutUsecase;
  final GetUserProfileUsecase getUserProfileUsecase;
  final CheckAuthStatusUsecase checkAuthStatusUsecase;
  final CheckEmailAvailabilityUsecase checkEmailAvailabilityUsecase;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController avatarController = TextEditingController();

  AuthViewmodel({
    required this.loginUsecase,
    required this.signupUsecase,
    required this.logoutUsecase,
    required this.getUserProfileUsecase,
    required this.checkAuthStatusUsecase,
    required this.checkEmailAvailabilityUsecase,
  }) : super(const AuthState.initial()) {
    checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
    state = AuthState.loading();

    final result = await checkAuthStatusUsecase();

    result.when(
      success: (isLoggedIn) async {
        if (isLoggedIn) {
          await getUserProfile();
        } else {
          state = const AuthState.unauthenticated();
        }
      },
      failure: (_) => state = const AuthState.unauthenticated(),
    );
  }

  Future<void> login() async {
    state = AuthState.loading();

    final result = await loginUsecase(
      email: emailController.text,
      password: passwordController.text,
    );

    result.when(
      success: (user) => state = AuthState.authenticated(user),
      failure: (error) => state = AuthState.error(error.message!),
    );
  }

  Future<void> signup() async {
    state = AuthState.loading();

    final result = await signupUsecase(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      avatar: avatarController.text,
    );

    result.when(
      success: (user) => {state = AuthState.authenticated(user)},
      failure: (error) => state = AuthState.error(error.message!),
    );
  }

  Future<void> logout() async {
    final result = await logoutUsecase();

    result.when(
      success: (_) => state = AuthState.unauthenticated(),
      failure: (error) => state = AuthState.error(error.message!),
    );
  }

  Future<void> getUserProfile() async {
    final result = await getUserProfileUsecase();

    result.when(
      success: (user) => state = AuthState.authenticated(user),
      failure: (failure) => const AuthState.unauthenticated(),
    );
  }

  User? get currentUser =>
      state.maybeWhen(authenticated: (user) => user, orElse: () => null);

  bool get isAuthenticated =>
      state.maybeWhen(authenticated: (user) => true, orElse: () => false);
}
