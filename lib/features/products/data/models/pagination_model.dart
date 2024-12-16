
class PaginationModel {
  int? total;
  int? totalPages;
  int? currentPage;
  int? productsPerPage;

  PaginationModel({
    this.total,
    this.totalPages,
    this.currentPage,
    this.productsPerPage,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      currentPage: json['current_page'] as int?,
      productsPerPage: json['products_per_page'] as int?,
    );
  }
}