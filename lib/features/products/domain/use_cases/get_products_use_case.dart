import 'package:either_dart/src/either.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/exceptions/failure.dart';
import 'package:mitch_designs_task/core/use_case/use_case.dart';
import 'package:mitch_designs_task/features/products/domain/entity/poduct_entity.dart';
import 'package:mitch_designs_task/features/products/domain/entity/product_response_entity.dart';
import 'package:mitch_designs_task/features/products/domain/repository/base_products_repository.dart';

class GetProductsUseCase extends UseCaseWithParam<ProductResponseEntity, ProductRequest> {

  final BaseProductsRepository baseProductsRepository;


  GetProductsUseCase(this.baseProductsRepository);


  @override
  Future<Either<Failure, ProductResponseEntity>> call(
      ProductRequest paramEntity) {
    return baseProductsRepository.getProducts(paramEntity);
  }

}
