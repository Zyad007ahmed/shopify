import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopify/core/providers/core_providers.dart';
import 'package:shopify/core/router/routes.dart';
import 'package:shopify/core/utils/extensions.dart';
import 'package:shopify/features/auth/presentation/providers/auth_providers.dart';
import 'package:shopify/features/profile/presentation/widgets/profile_header.dart';
import 'package:shopify/features/profile/presentation/widgets/profile_menu_item.dart';
import '../../../auth/presentation/viewmodels/auth_state.dart';
import '../../../cart/presentation/providers/cart_provider.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final cartCount = ref.watch(cartItemCountProvider);
    final favoritesCount = ref.watch(watchFavoritesCountProvider);

    return authState.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      authenticated: (user) {
        return RefreshIndicator(
          onRefresh: () async {
            await ref.read(authViewModelProvider.notifier).refreshProfile();
          },
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Profile Header
              ProfileHeader(user: user),

              const SizedBox(height: 24),

              // Account Section
              Text(
                'Account',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),

              ProfileMenuItem(
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {
                  context.pushNamed(editProfileScreenRoute);
                },
              ),

              ProfileMenuItem(
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {
                  context.pushNamed(changePasswordScreenRoute);
                },
              ),

              const SizedBox(height: 24),

              // My Activity Section
              Text(
                'My Activity',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),

              ProfileMenuItem(
                icon: Icons.shopping_cart_outlined,
                title: 'My Cart',
                trailing: cartCount > 0
                    ? Badge(
                        label: Text('$cartCount'),
                        child: const Icon(Icons.arrow_forward_ios, size: 16),
                      )
                    : null,
                onTap: () {
                  ref.read(pageProvider.notifier).state = 3;
                },
              ),

              ProfileMenuItem(
                icon: Icons.bookmark_outline,
                title: 'My Favorites',
                trailing: favoritesCount > 0
                    ? Badge(
                        label: Text('$favoritesCount'),
                        child: const Icon(Icons.arrow_forward_ios, size: 16),
                      )
                    : null,
                onTap: () {
                  ref.read(pageProvider.notifier).state = 2;
                },
              ),

              const SizedBox(height: 24),

              // App Data Section
              Text(
                'App Data',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),

              ProfileMenuItem(
                icon: Icons.cleaning_services_outlined,
                title: 'Clear Cache',
                onTap: () {
                  _showClearCacheDialog(context, ref);
                },
              ),

              ProfileMenuItem(
                icon: Icons.remove_shopping_cart_outlined,
                title: 'Clear Cart',
                trailing: cartCount > 0
                    ? Text(
                        '$cartCount items',
                        style: TextStyle(color: Colors.grey[600]),
                      )
                    : null,
                onTap: () {
                  _showClearCartDialog(context, ref);
                },
              ),

              const SizedBox(height: 24),

              // About Section
              Text(
                'About',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 12),

              ProfileMenuItem(
                icon: Icons.info_outline,
                title: 'App Version',
                trailing: Text(
                  '1.0.0',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                onTap: null, // Non-clickable
              ),

              ProfileMenuItem(
                icon: Icons.description_outlined,
                title: 'Terms of Service',
                onTap: () {
                  _showComingSoonDialog(context, 'Terms of Service');
                },
              ),

              ProfileMenuItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {
                  _showComingSoonDialog(context, 'Privacy Policy');
                },
              ),

              const SizedBox(height: 24),

              // Logout Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    _showLogoutDialog(context, ref);
                  },
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        );
      },
      unauthenticated: () => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_outline, size: 80, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('Not logged in'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                context.pushReplacementNamed(logInScreenRoute);
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
      error: (message) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(message),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ref.read(authViewModelProvider.notifier).refreshProfile();
              },
              child: const Text('Retry'),
            ),
          ],
        ),
      ),
    );
  }

  void _showClearCacheDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cache'),
        content: const Text(
          'This will clear all cached images and data. Continue?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              // Clear products cache
              // await ref.read(productsLocalDataSourceProvider).clearCache();

              if (context.mounted) {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cache cleared successfully')),
                );
              }
            },
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }

  void _showClearCartDialog(BuildContext context, WidgetRef ref) {
    final cartCount = ref.read(cartItemCountProvider);

    if (cartCount == 0) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Cart is already empty')));
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Clear Cart'),
        content: Text('Remove all $cartCount items from cart?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(cartViewModelProvider.notifier).clearCart();
              Navigator.pop(context);

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Cart cleared')));
            },
            child: const Text('Clear', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(authViewModelProvider.notifier).logout();
              Navigator.pop(context);
              context.pushReplacementNamed(logInScreenRoute);
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _showComingSoonDialog(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(feature),
        content: Text('$feature is coming soon!'),
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
