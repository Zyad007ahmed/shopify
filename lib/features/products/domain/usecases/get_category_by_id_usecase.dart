import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/category.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class GetCategoryByIdUsecase {
  final ProductsRepository repository;

  GetCategoryByIdUsecase(this.repository);

  Future<ApiResult<Category>> call(int id) async {
    return await repository.getCategoryById(id);
  }
}
