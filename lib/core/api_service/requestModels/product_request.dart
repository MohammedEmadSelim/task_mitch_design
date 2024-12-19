class ProductRequest {
  final int pageNumber;
  final int productsCountPerPage;
   String? sortingCriteria;
   String? sortingArrangement;

  ProductRequest( {
    required this.pageNumber,
    required this.productsCountPerPage,
     this.sortingCriteria,
     this.sortingArrangement,
  });
}
