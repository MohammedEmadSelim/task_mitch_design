import 'package:mitch_designs_task/features/products/data/mappers/pagination_mapper.dart';
import 'package:mitch_designs_task/features/products/data/mappers/product_mapper.dart';
import 'package:mitch_designs_task/features/products/data/models/products_response_model.dart';
import 'package:mitch_designs_task/features/products/domain/entity/product_response_entity.dart';

class ProductResponseMapper {
  static ProductResponseEntity mapToProductResponseEntity(
          ProductResponseModel productResponseModel) =>
      ProductResponseEntity(
          products: productResponseModel.products
              .map(
                (e) => ProductMapper.mapToProductEntity(e),
              )
              .toList(),
          paginationEntity: PaginationMapper.mapToPaginationEntity(
              productResponseModel.pagination));
}
