import 'package:hive/hive.dart';
import 'package:shopify/features/cart/domain/entities/cart_item_entity.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

@HiveType(typeId: 1)
class CartItemModel extends HiveObject {
  @HiveField(0)
  final int productId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final double price;

  @HiveField(3)
  final String image;

  @HiveField(4)
  final int quantity;

  @HiveField(5)
  final DateTime addedAt;

  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.addedAt,
  });

  double get itemTotal => price * quantity;

  factory CartItemModel.fromProduct(Product product, {int quantity = 1}) {
    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: product.price,
      image: product.mainImage!,
      quantity: quantity,
      addedAt: DateTime.now(),
    );
  }

  CartItem toEntity() {
    return CartItem(
      productId: productId,
      title: title,
      price: price,
      image: image,
      quantity: quantity,
      addedAt: addedAt,
    );
  }

  CartItemModel copyWith({
    int? productId,
    String? title,
    double? price,
    String? image,
    int? quantity,
    DateTime? addedAt,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      title: title ?? this.title,
      price: price ?? this.price,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      addedAt: addedAt ?? this.addedAt,
    );
  }
}
