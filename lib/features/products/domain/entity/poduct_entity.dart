import 'package:mitch_designs_task/features/products/domain/entity/paginationEntity.dart';

class ProductEntity {
  final int id;
  final String name;
  final String price;
  final String img;
  final PaginationEntity paginationEntity;

  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.img,
    required this.paginationEntity,
  });
}
