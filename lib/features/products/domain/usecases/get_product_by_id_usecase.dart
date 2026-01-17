import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/products/domain/entities/product.dart';
import 'package:shopify/features/products/domain/repos/products_repository.dart';

class GetProductByIdUsecase {
  final ProductsRepository repository;

  GetProductByIdUsecase(this.repository);

  Future<ApiResult<Product>> call(int id) async {
    return await repository.getProductById(id);
  }
}
