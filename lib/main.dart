import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shopify/core/storage/first_launch_service.dart';
import 'package:shopify/features/cart/data/models/cart_item_model.dart';
import 'package:shopify/features/cart/data/models/cart_item_model_adapter.dart';
import 'package:shopify/features/favorites/data/models/favorite_model.dart';
import 'package:shopify/features/favorites/data/models/favorite_model_adapter.dart';
import 'package:shopify/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initHive();

  final isFirstLaunch = await FirstLaunchService.isFirstLaunch();

  runApp(ProviderScope(child: MyApp(isFirstLaunch: isFirstLaunch)));
}

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(FavoriteModelAdapter());
  await Hive.openBox<FavoriteModel>('favorites');

  Hive.registerAdapter(CartItemModelAdapter());
  await Hive.openBox<CartItemModel>('cart');
}
