import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class GetCategoryProductsUsecase {
  final ProductsRepository repository;

  GetCategoryProductsUsecase(this.repository);

  Future<ApiResult<List<Product>>> call(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  }) async {
    return await repository.getCategoryProducts(
      categoryId,
      offset: offset,
      limit: limit,
    );
  }
}
