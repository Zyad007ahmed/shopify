import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

import '../entities/cart_item_entity.dart';

class GetCartItemsUseCase {
  final CartRepository repository;

  GetCartItemsUseCase(this.repository);

  Future<ApiResult<List<CartItem>>> call() async {
    return await repository.getCartItems();
  }
}
