import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shopify/core/providers/core_providers.dart';

class EmptyCartWidget extends ConsumerWidget {
  const EmptyCartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Empty Cart Icon
            Icon(
              Icons.shopping_cart_outlined,
              size: 120,
              color: Colors.grey[300],
            ),

            const SizedBox(height: 24),

            // Title
            Text(
              'Your cart is empty',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 12),

            // Description
            Text(
              'Add items to your cart to see them here',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // Start Shopping Button
            ElevatedButton.icon(
              onPressed: () => goToHomeScreen(ref),
              icon: const Icon(Icons.shopping_bag_outlined),
              label: const Text('Start Shopping'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToHomeScreen(WidgetRef ref) {
    ref.read(pageProvider.notifier).state = 0;
  }
}
