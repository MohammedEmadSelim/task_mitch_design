import 'package:either_dart/either.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/exceptions/failure.dart';
import 'package:mitch_designs_task/features/products/domain/entity/product_response_entity.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure,ProductResponseEntity>> getProducts(ProductRequest productRequest);
}