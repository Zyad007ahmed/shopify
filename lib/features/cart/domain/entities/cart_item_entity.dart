class CartItem {
  final int productId;
  final String title;
  final double price;
  final String image;
  final int quantity;
  final DateTime addedAt;

  const CartItem({
    required this.productId,
    required this.title,
    required this.price,
    required this.image,
    required this.quantity,
    required this.addedAt,
  });

  double get itemTotal => price * quantity;

  String get formattedPrice => '\$${price.toStringAsFixed(2)}';

  String get formattedItemTotal => '\$${itemTotal.toStringAsFixed(2)}';
}
