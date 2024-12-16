import 'package:get_it/get_it.dart';
import 'package:mitch_designs_task/features/products/data/data_source/products_remote_data_source.dart';
import 'package:mitch_designs_task/features/products/data/repository/products_repository.dart';
import 'package:mitch_designs_task/features/products/domain/use_cases/get_products_use_case.dart';

GetIt sl = GetIt.instance;
Future <void>init()async{
  sl.registerSingleton<ProductsRemoteDataSource>(ProductsRemoteDataSource());
  sl.registerSingleton<ProductsRepository>(ProductsRepository(sl.get<ProductsRemoteDataSource>()));
  sl.registerSingleton<GetProductsUseCase>(GetProductsUseCase(sl.get<ProductsRepository>()));
}