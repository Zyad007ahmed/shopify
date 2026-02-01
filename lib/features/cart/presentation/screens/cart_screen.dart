import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shopify/features/cart/presentation/viewmodel/cart_state.dart';
import 'package:shopify/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:shopify/features/cart/presentation/widgets/cart_summary.dart';
import 'package:shopify/features/cart/presentation/widgets/empty_cart_widget.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartViewModelProvider);

    return cartState.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      loaded: (items, subtotal, totalItems) {
        return loadedSetup(ref, items, subtotal, totalItems, context);
      },
      empty: () => const EmptyCartWidget(),
      error: (message) => errorSetup(context, message, ref),
    );
  }

  Center errorSetup(BuildContext context, String message, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Error', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.read(cartViewModelProvider.notifier).loadCart();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Column loadedSetup(
    WidgetRef ref,
    List<CartItem> items,
    double subtotal,
    int totalItems,
    BuildContext context,
  ) {
    return Column(
      children: [
        // Cart Items List
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await ref.read(cartViewModelProvider.notifier).refreshCart();
            },
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return CartItemCard(
                  item: item,
                  onRemove: () {
                    _showRemoveDialog(context, ref, item.productId, item.title);
                  },
                  onIncrease: () {
                    ref
                        .read(cartViewModelProvider.notifier)
                        .increaseQuantity(item.productId);
                  },
                  onDecrease: () {
                    ref
                        .read(cartViewModelProvider.notifier)
                        .decreaseQuantity(item.productId);
                  },
                );
              },
            ),
          ),
        ),

        // Cart Summary (Fixed at bottom)
        CartSummary(
          subtotal: subtotal,
          totalItems: totalItems,
          onCheckout: () {
            _showCheckoutDialog(context);
          },
        ),
      ],
    );
  }

  void _showRemoveDialog(
    BuildContext context,
    WidgetRef ref,
    int productId,
    String title,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: Text('Remove "$title" from cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(cartViewModelProvider.notifier)
                  .removeFromCart(productId);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Item removed from cart'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Checkout'),
        content: const Text('Checkout feature is coming soon!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
