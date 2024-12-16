import 'package:mitch_designs_task/features/products/data/models/pagination_model.dart';
import 'package:mitch_designs_task/features/products/domain/entity/pagination_entity.dart';

class PaginationMapper{
  static PaginationEntity mapToPaginationEntity(PaginationModel paginationModel)=>PaginationEntity(total: paginationModel.total!, totalPages: paginationModel.totalPages!, currentPage: paginationModel.currentPage!, productsPerPage: paginationModel.productsPerPage!);
}