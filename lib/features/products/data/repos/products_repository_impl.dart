import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/core/utils/functions.dart';
import 'package:shopify/features/products/data/datasources/products_remote_data_source.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource dataSource;

  ProductsRepositoryImpl({required this.dataSource});

  @override
  Future<ApiResult<List<Product>>> getProducts({
    int offset = 0,
    int limit = 10,
  }) async {
    return await tryAndHandleError<List<Product>>(() async {
      return (await dataSource.getProducts(
        offset: offset,
        limit: limit,
      )).map((productModel) => productModel.toEntity()).toList();
    });
  }

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    return await tryAndHandleError<List<Category>>(() async {
      return (await dataSource.getCategories())
          .map((categoryModel) => categoryModel.toEntity())
          .toList();
    });
  }

  @override
  Future<ApiResult<List<Product>>> getCategoryProducts(
    int categoryId, {
    int offset = 0,
    int limit = 10,
  }) async {
    return await tryAndHandleError<List<Product>>(() async {
      return (await dataSource.getCategoryProducts(
        categoryId,
        offset: offset,
        limit: limit,
      )).map((productModel) {
        return productModel.toEntity();
      }).toList();
    });
  }

  @override
  Future<ApiResult<Category>> getCategoryById(int id) async {
    return await tryAndHandleError<Category>(() async {
      return (await dataSource.getCategoryById(id)).toEntity();
    });
  }

  @override
  Future<ApiResult<Product>> getProductById(int id) async {
    return await tryAndHandleError<Product>(() async {
      return (await dataSource.getProductById(id)).toEntity();
    });
  }

  @override
  Future<ApiResult<List<Product>>> searchProducts(
    String title, {
    int offset = 0,
    int limit = 10,
  }) async {
    return await tryAndHandleError<List<Product>>(() async {
      return (await dataSource.searchProducts(
        title,
        offset: offset,
        limit: limit,
      )).map((productModel) => productModel.toEntity()).toList();
    });
  }

  @override
  Future<ApiResult<List<Product>>> getRelatedProducts(
    int id, {
    int offset = 0,
    int limit = 10,
  }) async {
    return await tryAndHandleError<List<Product>>(() async {
      return (await dataSource.getRelatedProducts(
        id,
        offset: offset,
        limit: limit,
      )).map((productModel) => productModel.toEntity()).toList();
    });
  }
}
