import 'package:dio/dio.dart';
import 'package:mitch_designs_task/core/api_service/api_end_points.dart';
import 'package:mitch_designs_task/core/api_service/dio_service.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/exceptions/exceptions.dart';
import 'package:mitch_designs_task/features/products/data/models/products_response_model.dart';

abstract class BaseProductsRemoteDataSource{
  Future <ProductResponseModel>getProducts(ProductRequest productRequest);
}


class ProductsRemoteDataSource extends BaseProductsRemoteDataSource{

  @override
  Future<ProductResponseModel> getProducts(ProductRequest productRequest) async{
    try{
      Response response = await DioFinalHelper.getData(method: EndPoints.products,param: {
        'price_range[]': [0, 10000],
        'sort[criteria]': productRequest.sortingCriteria,
        'sort[arrangement]': productRequest.sortingArrangement,
        'page': productRequest.pageNumber,
        'category': 'assorted-bakeries',
        'products_per_page': 5,
      });
      print(response.data['pagination']);
    if (response.statusCode!= 200){
      throw CustomException();
    }
      return ProductResponseModel.fromJson(response.data);
    } catch (e){
      throw e;
    }


  }

}