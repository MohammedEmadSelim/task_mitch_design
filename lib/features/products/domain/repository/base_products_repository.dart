import 'package:either_dart/either.dart';
import 'package:mitch_designs_task/core/exceptions/failure.dart';
import 'package:mitch_designs_task/features/products/domain/entity/poduct_entity.dart';

abstract class BaseProductsRepository {
  Future<Either<Failure,List<ProductEntity>>> getProducts(int pageNumber,int productsCount);
}