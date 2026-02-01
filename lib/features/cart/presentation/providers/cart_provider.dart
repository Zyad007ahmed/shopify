import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shopify/features/cart/data/repos/cart_repository_impl.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';
import 'package:shopify/features/cart/domain/usecases/decrease_quantity_usecase.dart';
import 'package:shopify/features/cart/domain/usecases/increase_quantity_usecase.dart';
import 'package:shopify/features/cart/presentation/viewmodel/cart_state.dart';
import 'package:shopify/features/cart/presentation/viewmodel/cart_viewmodel.dart';
import '../../data/datasources/cart_local_datasource.dart';
import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_count_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';
import '../../domain/usecases/get_cart_total_usecase.dart';
import '../../domain/usecases/is_in_cart_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';

// DATA SOURCE PROVIDER
final cartLocalDataSourceProvider = Provider<CartLocalDataSource>((ref) {
  return CartLocalDataSourceImpl();
});

// REPOSITORY PROVIDER
final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final localDataSource = ref.watch(cartLocalDataSourceProvider);
  return CartRepositoryImpl(localDataSource);
});

// USE CASE PROVIDERS
final getCartItemsUseCaseProvider = Provider<GetCartItemsUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return GetCartItemsUseCase(repository);
});

final addToCartUseCaseProvider = Provider<AddToCartUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return AddToCartUseCase(repository);
});

final removeFromCartUseCaseProvider = Provider<RemoveFromCartUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return RemoveFromCartUseCase(repository);
});

final increaseQuantityUseCaseProvider = Provider<IncreaseQuantityUseCase>((
  ref,
) {
  final repository = ref.watch(cartRepositoryProvider);
  return IncreaseQuantityUseCase(repository);
});

final decreaseQuantityUseCaseProvider = Provider<DecreaseQuantityUseCase>((
  ref,
) {
  final repository = ref.watch(cartRepositoryProvider);
  return DecreaseQuantityUseCase(repository);
});

final clearCartUseCaseProvider = Provider<ClearCartUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return ClearCartUseCase(repository);
});

final getCartCountUseCaseProvider = Provider<GetCartCountUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return GetCartCountUseCase(repository);
});

final getCartTotalUseCaseProvider = Provider<GetCartTotalUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return GetCartTotalUseCase(repository);
});

final isInCartUseCaseProvider = Provider<IsInCartUseCase>((ref) {
  final repository = ref.watch(cartRepositoryProvider);
  return IsInCartUseCase(repository);
});

// VIEWMODEL PROVIDER
final cartViewModelProvider = StateNotifierProvider<CartViewModel, CartState>((
  ref,
) {
  return CartViewModel(
    getCartItemsUseCase: ref.watch(getCartItemsUseCaseProvider),
    addToCartUseCase: ref.watch(addToCartUseCaseProvider),
    removeFromCartUseCase: ref.watch(removeFromCartUseCaseProvider),
    increaseQuantityUseCase: ref.watch(increaseQuantityUseCaseProvider),
    decreaseQuantityUseCase: ref.watch(decreaseQuantityUseCaseProvider),
    clearCartUseCase: ref.watch(clearCartUseCaseProvider),
  );
});

// HELPER PROVIDERS

// Check if product is in cart
final isProductInCartProvider = Provider.family<bool, int>((ref, productId) {
  final cartState = ref.watch(cartViewModelProvider);

  if (cartState is CartLoaded) {
    return cartState.items.any((item) => item.productId == productId);
  }

  return false;
});

// Get cart count (watches state for auto-update)
final cartItemCountProvider = Provider<int>((ref) {
  final cartState = ref.watch(cartViewModelProvider);

  if (cartState is CartLoaded) {
    return cartState.totalItems;
  }

  return 0;
});

// Get cart subtotal
final cartSubtotalProvider = Provider<double>((ref) {
  final cartState = ref.watch(cartViewModelProvider);
  if (cartState is CartLoaded) {
    return cartState.subtotal;
  }
  return 0.0;
});

// Formatted subtotal
final formattedCartSubtotalProvider = Provider<String>((ref) {
  final subtotal = ref.watch(cartSubtotalProvider);
  return '\$${subtotal.toStringAsFixed(2)}';
});
