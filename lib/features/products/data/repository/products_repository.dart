import 'package:either_dart/src/either.dart';
import 'package:mitch_designs_task/core/exceptions/exceptions.dart';
import 'package:mitch_designs_task/core/exceptions/failure.dart';
import 'package:mitch_designs_task/features/products/data/data_source/products_remote_data_source.dart';
import 'package:mitch_designs_task/features/products/data/mappers/product_mapper.dart';
import 'package:mitch_designs_task/features/products/data/mappers/product_response_mapper.dart';
import 'package:mitch_designs_task/features/products/data/models/products_response_model.dart';
import 'package:mitch_designs_task/features/products/domain/entity/poduct_entity.dart';
import 'package:mitch_designs_task/features/products/domain/entity/product_response_entity.dart';
import 'package:mitch_designs_task/features/products/domain/repository/base_products_repository.dart';

class ProductsRepository extends BaseProductsRepository{
  final BaseProductsRemoteDataSource baseProductsRemoteDataSource;

  ProductsRepository(this.baseProductsRemoteDataSource);

  @override
  Future<Either<Failure,ProductResponseEntity>> getProducts(int pageNumber, int productsCount) async{
   try{
     var res  = await  baseProductsRemoteDataSource.getProducts(pageNumber, productsCount);
     return Right(ProductResponseMapper.mapToProductResponseEntity(res));
   }
   on CustomException catch (e){
     return Left(CustomFailure(error: 'Internal Error'));
   }catch (e){
     return Left(CustomFailure(error: 'error un known'));
   }


  }


}