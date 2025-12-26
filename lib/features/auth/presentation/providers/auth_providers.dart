import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/core/providers/core_providers.dart';
import 'package:shopify/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:shopify/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:shopify/features/auth/data/repos/auth_repository_impl.dart';
import 'package:shopify/features/auth/domain/entities/user.dart';
import 'package:shopify/features/auth/domain/repos/auth_repository.dart';
import 'package:shopify/features/auth/domain/usecases/check_auth_status_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/check_email_availability_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/get_user_profile_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/login_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/logout_usecase.dart';
import 'package:shopify/features/auth/domain/usecases/signup_usecase.dart';
import 'package:shopify/features/auth/presentation/viewmodels/auth_state.dart';
import 'package:shopify/features/auth/presentation/viewmodels/auth_viewmodel.dart';

// DATA SOURCE PROVIDERS
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSourceImpl(dio);
});

final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final storage = ref.watch(storageProvider);
  return AuthLocalDataSourceImpl(storage);
});

// REPOSITORY PROVIDER
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
});

// USE CASE PROVIDERS
final loginUsecaseProvider = Provider<LoginUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LoginUsecase(authRepository);
});

final signupUsecaseProvider = Provider<SignupUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return SignupUsecase(authRepository);
});

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return LogoutUsecase(authRepository);
});

final getUserProfileUsecaseProvider = Provider<GetUserProfileUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return GetUserProfileUsecase(authRepository);
});

final checkAuthStatusUsecaseProvider = Provider<CheckAuthStatusUsecase>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return CheckAuthStatusUsecase(authRepository);
});

final checkEmailAvailabilityUsecaseProvider =
    Provider<CheckEmailAvailabilityUsecase>((ref) {
      final authRepository = ref.watch(authRepositoryProvider);
      return CheckEmailAvailabilityUsecase(authRepository);
    });

// VIEWMODEL PROVIDER
final authViewModelProvider = StateNotifierProvider<AuthViewmodel, AuthState>((
  ref,
) {
  return AuthViewmodel(
    loginUsecase: ref.watch(loginUsecaseProvider),
    signupUsecase: ref.watch(signupUsecaseProvider),
    logoutUsecase: ref.watch(logoutUsecaseProvider),
    getUserProfileUsecase: ref.watch(getUserProfileUsecaseProvider),
    checkAuthStatusUsecase: ref.watch(checkAuthStatusUsecaseProvider),
    checkEmailAvailabilityUsecase: ref.watch(
      checkEmailAvailabilityUsecaseProvider,
    ),
  );
});

// HELPER PROVIDERS
final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authViewModelProvider.notifier).currentUser;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authViewModelProvider.notifier).isAuthenticated;
});
