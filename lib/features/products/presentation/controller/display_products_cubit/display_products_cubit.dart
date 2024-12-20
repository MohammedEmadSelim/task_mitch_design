import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/service_locator/locator.dart';
import 'package:mitch_designs_task/features/products/domain/entity/poduct_entity.dart';
import 'package:mitch_designs_task/features/products/domain/use_cases/get_products_use_case.dart';

part 'display_products_state.dart';

class DisplayProductsCubit extends Cubit<DisplayProductsState> {
  DisplayProductsCubit() : super(DisplayProductsInitial());
  GetProductsUseCase getProductsUseCase = sl.get<GetProductsUseCase>();

  List<ProductEntity> allItems = [];
  bool isLoading = true;
  bool hasMore = false;
  int currentPage = 1;


   String sortingCriteria = 'price';
   String sortingManagement = 'ASC';
   String groupValue ='price';

  void changeGroupValue(String val){
    groupValue = val;
    emit(DisplayProductsChangeGroupValue());
  }
  Future<void> getProducts(ProductRequest product) async {
    product.sortingCriteria = sortingCriteria;
    product.sortingArrangement = sortingManagement;
    //avoid display every call
    if (currentPage == 1) {
      emit(DisplayProductsLoading());
    }
    final res = await getProductsUseCase.call(product);
    res.fold(
      (left) {
        emit(DisplayProductsFailure());
      },
      (right) {
        allItems.addAll(right.products);

        if (currentPage < right.paginationEntity.totalPages) {
          hasMore = true;
        }

        emit(DisplayProductsSuccess(
            (currentPage < right.paginationEntity.totalPages)));
      },
    );
  }
 void selectArrangement(){
 emit(DisplayProductsSelectArrangement());

 }

}
