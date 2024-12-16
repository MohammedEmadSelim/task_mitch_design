class PaginationEntity {
  int total;
  int totalPages;
  int currentPage;
  int productsPerPage;

  PaginationEntity({
    required this.total,
    required this.totalPages,
    required this.currentPage,
    required this.productsPerPage,
  });


}