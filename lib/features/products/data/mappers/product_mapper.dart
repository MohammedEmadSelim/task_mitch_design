import 'package:mitch_designs_task/features/products/data/models/pagination_model.dart';
import 'package:mitch_designs_task/features/products/data/models/product_model.dart';
import 'package:mitch_designs_task/features/products/domain/entity/pagination_entity.dart';
import 'package:mitch_designs_task/features/products/domain/entity/poduct_entity.dart';

class ProductMapper {
  static ProductEntity mapToProductEntity(
          ProductModel product) =>
      ProductEntity(
          id: product.id!,
          name: product.arName ?? "",
          price: product.price ?? '',
          img: product.mainImg!.src ?? '',
          );
}
