import 'package:shopify/core/network/api_result.dart';
import 'package:shopify/features/cart/domain/repos/cart_repository.dart';

class GetCartTotalUseCase {
  final CartRepository repository;

  GetCartTotalUseCase(this.repository);

  Future<ApiResult<double>> call() async {
    return await repository.getCartTotal();
  }
}
