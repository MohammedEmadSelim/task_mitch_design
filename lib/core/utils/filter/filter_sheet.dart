import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/responsive/dimension.dart';
import 'package:mitch_designs_task/core/theme/colors.dart';
import 'package:mitch_designs_task/core/widgets/tap_effect.dart';
import 'package:mitch_designs_task/features/products/presentation/controller/display_products_cubit/display_products_cubit.dart';

void showCustomDialog(BuildContext context, DisplayProductsCubit cubit) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 700),
    pageBuilder: (context, anim1, anim2) {
      return BlocProvider(
        create: (context) => DisplayProductsCubit(),
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.08,
              left: 0.w,
              right: 0.w,
              child: Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: SizedBox(
                  height: 250.h,
                  width: MediaQuery.of(context).size.width * 1.2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RadioListTile(
                          activeColor: AppColors.darkBlue,
                          title: const Text(
                            'السعر',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          value: 'price',
                          groupValue: cubit.groupValue,
                          onChanged: (value) {
                            cubit.changeGroupValue(value as String);
                            cubit.allItems.clear();
                            cubit.sortingCriteria = 'price';

                            cubit.getProducts(ProductRequest(
                                pageNumber: cubit.currentPage = 1,
                                productsCountPerPage: 5));
                            print(cubit.allItems.length);

                            Navigator.pop(context);
                          },
                        ),
                        RadioListTile(
                          activeColor: AppColors.darkBlue,
                          title: const Text(
                            'التاريخ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          value: 'date',
                          groupValue: cubit.groupValue,
                          onChanged: (value) {
                            cubit.changeGroupValue(value as String);
                            cubit.allItems.clear();
                            cubit.sortingCriteria = 'date';
                            cubit.currentPage = 1;
                            print('=========================');
                            print(cubit.currentPage);
                            cubit.getProducts(ProductRequest(
                                pageNumber: cubit.currentPage,
                                productsCountPerPage: 5));

                            Navigator.pop(context);
                          },
                        ),
                        RadioListTile(
                          activeColor: AppColors.darkBlue,
                          title: const Text(
                            'الاسم',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          value: 'name',
                          groupValue: cubit.groupValue,
                          onChanged: (value) {
                            cubit.changeGroupValue(value as String);
                            cubit.allItems.clear();
                            cubit.sortingCriteria = 'name';

                            cubit.getProducts(ProductRequest(
                                pageNumber: cubit.currentPage = 1,
                                productsCountPerPage: 5));
                            print(cubit.allItems.length);
                            Navigator.pop(context);
                          },
                        ),
                        BlocConsumer<DisplayProductsCubit,
                            DisplayProductsState>(
                          listener: (context, state) {},
                          // buildWhen: (previous, current) => current is DisplayProductsSelectArrangement,
                          builder: (context, state) {

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TapEffect(
                                    onClick: () {
                                      cubit.sortingManagement = 'ASC';
                                      context.read<DisplayProductsCubit>().selectArrangement();
                                      print('object');
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              cubit.sortingManagement == 'ASC'
                                                  ? AppColors.darkBlue
                                                  : null,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              color: AppColors.grey)),
                                      width: 70.w,
                                      height: 30.h,
                                      child:  Text(
                                        'تصاعدي',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: cubit.sortingManagement == 'ASC'
                                                ? AppColors.white
                                                : AppColors.black
                                        ),
                                      ),
                                    )),
                                SizedBox(
                                  width: 5.w,
                                ),
                                TapEffect(
                                    onClick: () {
                                      cubit.sortingManagement = 'DESC';
                                      context.read<DisplayProductsCubit>().selectArrangement();

                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                              cubit.sortingManagement == 'DESC'
                                                  ? AppColors.darkBlue
                                                  : null,
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          border: Border.all(
                                              color: AppColors.grey)),
                                      width: 70.w,
                                      height: 30.h,
                                      child:  Text(
                                        'تنازلي',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: cubit.sortingManagement == 'DESC'
                                              ? AppColors.white
                                              : AppColors.black
                                        ),

                                      ),
                                    )),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
    transitionBuilder: (context, anim1, anim2, child) {
      // Slide up animation
      return SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 1),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(
          parent: anim1,
          curve: Curves.easeInOut,
        )),
        child: child,
      );
    },
  );
}
