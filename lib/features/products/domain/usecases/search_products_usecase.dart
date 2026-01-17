import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class SearchProductsUsecase {
  final ProductsRepository repository;

  SearchProductsUsecase(this.repository);

  Future<ApiResult<List<Product>>> call(
    String title, {
    int offset = 0,
    int limit = 10,
  }) async {
    return await repository.searchProducts(title, offset: offset, limit: limit);
  }
}
