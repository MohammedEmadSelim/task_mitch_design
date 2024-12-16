import 'package:mitch_designs_task/features/products/domain/entity/pagination_entity.dart';

class ProductEntity {
  final int id;
  final String name;
  final String price;
  final String img;


  ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.img,

  });
}
