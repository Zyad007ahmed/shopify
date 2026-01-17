import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shopify/core/constants/api_constants.dart';
import 'package:shopify/features/products/data/models/category_model.dart';
import 'package:shopify/features/products/data/models/product_model.dart';

part 'products_remote_data_source.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ProductsRemoteDataSource {
  factory ProductsRemoteDataSource(Dio dio, {String baseUrl}) =
      _ProductsRemoteDataSource;

  @GET(ApiConstants.productsEP)
  Future<List<ProductModel>> getProducts({
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 10,
  });

  @GET('${ApiConstants.productsEP}/{id}')
  Future<ProductModel> getProductById(@Path('id') int id);

  @GET(ApiConstants.productsEP)
  Future<List<ProductModel>> searchProducts(
    @Query('title') String title, {
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 10,
  });

  @GET(ApiConstants.productsEP)
  Future<List<ProductModel>> getCategoryProducts(
    @Query('categoryId') int categoryId, {
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 10,
  });

  @GET(ApiConstants.categoriesEP)
  Future<List<CategoryModel>> getCategories();

  @GET('${ApiConstants.categoriesEP}/{id}')
  Future<CategoryModel> getCategoryById(@Path('id') int id);

  @GET(ApiConstants.relatedProductsEP)
  Future<List<ProductModel>> getRelatedProducts(
    @Path('id') int id, {
    @Query('offset') int offset = 0,
    @Query('limit') int limit = 10,
  });
}
