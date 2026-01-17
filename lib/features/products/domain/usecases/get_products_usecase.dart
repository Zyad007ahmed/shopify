import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class GetProductsUsecase {
  final ProductsRepository repository;

  GetProductsUsecase(this.repository);

  Future<ApiResult<List<Product>>> call({
    int offset = 0,
    int limit = 10,
  }) async {
    return await repository.getProducts(offset: offset, limit: limit);
  }
}
