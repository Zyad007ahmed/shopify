import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<ApiResult<List<Product>>> getProducts({
    int offset = 0,
    int limit = 10,
  });
  Future<ApiResult<Product>> getProductById(int id);
  Future<ApiResult<List<Product>>> searchProducts(
    String title, {
    int offset = 0,
    int limit = 10,
  });
  Future<ApiResult<List<Product>>> getCategoryProducts(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  });
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<Category>> getCategoryById(int id);
  Future<ApiResult<List<Product>>> getRelatedProducts(
    int id, {
    int offset = 0,
    int limit = 10,
  });
}
