import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopify/core/constants/ui_constants.dart';
import 'package:shopify/core/providers/core_providers.dart';
import 'package:shopify/features/cart/presentation/screens/cart_screen.dart';
import 'package:shopify/features/favorites/presentation/screens/favorities_screen.dart';
import 'package:shopify/features/home/presentation/screens/home_screen.dart';
import 'package:shopify/features/profile/presentation/screens/profile_screen.dart';
import 'package:shopify/features/search/presentation/screens/search_screen.dart';

class EntryPoint extends ConsumerWidget {
  const EntryPoint({super.key});

  final List _pages = const [
    HomeScreen(),
    SearchScreen(),
    FavoritiesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  Color? get primaryColor => null;

  SvgPicture svgIcon(BuildContext context, String src, {Color? color}) {
    return SvgPicture.asset(
      src,
      height: 24,
      colorFilter: ColorFilter.mode(
        color ??
            Theme.of(context).iconTheme.color!.withValues(
              alpha: Theme.of(context).brightness == Brightness.dark ? 0.3 : 1,
            ),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(pageProvider);

    return Scaffold(
      appBar: AppBar(
        // pinned: true,
        // floating: true,
        // snap: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: const SizedBox(),
        leadingWidth: 0,
        centerTitle: false,
        title: SvgPicture.asset(
          "assets/logo/Shoplon.svg",
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color!,
            BlendMode.srcIn,
          ),
          height: 20,
          width: 100,
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(pageProvider.notifier).state = 1;
            },
            icon: SvgPicture.asset(
              "assets/icons/Search.svg",
              height: 24,
              colorFilter: ColorFilter.mode(
                Theme.of(context).textTheme.bodyLarge!.color!,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
      body: PageTransitionSwitcher(
        duration: defaultDuration,
        transitionBuilder: (child, animation, secondAnimation) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondAnimation,
            child: child,
          );
        },
        child: _pages[currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: defaultPadding / 2),
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : const Color(0xFF101015),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            if (index != currentIndex) {
              ref.read(pageProvider.notifier).state = index;
            }
          },
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? Colors.white
              : const Color(0xFF101015),
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          selectedItemColor: primaryColor,
          unselectedItemColor: Colors.transparent,
          items: [
            BottomNavigationBarItem(
              icon: svgIcon(context, "assets/icons/Shop.svg"),
              activeIcon: svgIcon(
                context,
                "assets/icons/Shop.svg",
                color: primaryColor,
              ),
              label: "Shop",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(context, "assets/icons/Category.svg"),
              activeIcon: svgIcon(
                context,
                "assets/icons/Category.svg",
                color: primaryColor,
              ),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(context, "assets/icons/Bookmark.svg"),
              activeIcon: svgIcon(
                context,
                "assets/icons/Bookmark.svg",
                color: primaryColor,
              ),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(context, "assets/icons/Bag.svg"),
              activeIcon: svgIcon(
                context,
                "assets/icons/Bag.svg",
                color: primaryColor,
              ),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: svgIcon(context, "assets/icons/Profile.svg"),
              activeIcon: svgIcon(
                context,
                "assets/icons/Profile.svg",
                color: primaryColor,
              ),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
