import 'package:mitch_designs_task/features/products/data/models/pagination_model.dart';
import 'package:mitch_designs_task/features/products/data/models/product_model.dart';

class ProductResponseModel {
  List<ProductModel> products;
  PaginationModel pagination;

  ProductResponseModel({required this.products, required this.pagination});

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      products: (json['products'] as List<dynamic>)
          .map((item) => ProductModel.fromJson(item))
          .toList(),
      pagination: PaginationModel.fromJson(json['pagination']),
    );
  }
}
