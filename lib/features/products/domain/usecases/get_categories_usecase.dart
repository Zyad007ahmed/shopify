import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class GetCategoriesUsecase {
  final ProductsRepository repository;

  GetCategoriesUsecase(this.repository);

  Future<ApiResult<List<Category>>> call() async {
    return await repository.getCategories();
  }
}
