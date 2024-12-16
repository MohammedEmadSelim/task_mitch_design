import 'package:dio/dio.dart';
import 'package:mitch_designs_task/core/api_service/api_end_points.dart';
import 'package:mitch_designs_task/core/api_service/dio_service.dart';
import 'package:mitch_designs_task/core/exceptions/exceptions.dart';
import 'package:mitch_designs_task/features/products/data/models/products_response_model.dart';

abstract class BaseProductsRemoteDataSource{
  Future <ProductResponseModel>getProducts(int pageNumber, int productsCount);
}


class ProductsRemoteDataSource extends BaseProductsRemoteDataSource{

  @override
  Future<ProductResponseModel> getProducts(int pageNumber, int productsCount) async{
    try{
      Response response = await DioFinalHelper.getData(method: EndPoints.products,query: {
        "price_range[]": 10000,
        "sort[criteria]": "price",
        "sort[arrangement]": "DESC",
        "page": pageNumber,
        "category": "assorted-bakeries",
        "products_per_page": productsCount
      });
      print(response.data);
    if (response.statusCode!= 200){
      throw CustomException();
    }
      return ProductResponseModel.fromJson(response.data);
    } catch (e){
      throw e;
    }


  }

}