import 'package:mitch_designs_task/features/products/domain/entity/pagination_entity.dart';
import 'package:mitch_designs_task/features/products/domain/entity/poduct_entity.dart';

class ProductResponseEntity {
  final List<ProductEntity> products;
  final PaginationEntity paginationEntity;

  ProductResponseEntity({
    required this.products,
    required this.paginationEntity,
  });
}
