import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class GetRelatedProductsUsecase {
  final ProductsRepository repository;

  GetRelatedProductsUsecase(this.repository);

  Future<ApiResult<List<Product>>> call(
    int productId, {
    int offset = 0,
    int limit = 10,
  }) async {
    return await repository.getRelatedProducts(
      productId,
      offset: offset,
      limit: limit,
    );
  }
}
