import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/constants/icons.dart';
import 'package:mitch_designs_task/core/theme/colors.dart';
import 'package:mitch_designs_task/core/utils/filter/filter_sheet.dart';
import 'package:mitch_designs_task/core/widgets/custom_svg.dart';
import 'package:mitch_designs_task/core/widgets/tap_effect.dart';
import 'package:mitch_designs_task/features/products/presentation/components/custom_bottom_navigation_bar.dart';
import 'package:mitch_designs_task/features/products/presentation/components/product_item.dart';
import 'package:mitch_designs_task/features/products/presentation/controller/display_products_cubit/display_products_cubit.dart';

class ViewProducts extends StatelessWidget {
  ViewProducts({super.key});

  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DisplayProductsCubit()
        ..getProducts(ProductRequest(
            pageNumber: 1,
            productsCountPerPage: 5,
          )),
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: AppBar(
          elevation: 0, // Remove shadow
          backgroundColor: AppColors.lightGrey,
          toolbarHeight: 90, // Set AppBar height
          titleSpacing: 0, // Align widgets to start

          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Search Icon Button
              Container(
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  icon: const Icon(Icons.search, color: Colors.black, size: 24),
                  onPressed: () async {},
                ),
              ),

              // Location Dropdown with Text
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: InkWell(
                  onTap: () {
                    // Handle dropdown tap

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "استلام من",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      const Row(
                        children: [
                          Icon(Icons.keyboard_arrow_down,
                              color: Colors.black54),
                          SizedBox(width: 4),
                          Text(
                            "فرع مول العرب",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Icon(Icons.location_on,
                              color: Colors.black54, size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1), // Line height
            child: Container(
              color: AppColors.lightBlue, // Line color
              height: 1, // Thickness of the line
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Title with Dropdown Icon
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "حلويات غربية",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.keyboard_arrow_down,
                              color: Colors.black87),
                        ],
                      ),
                      const SizedBox(height: 12), // Spacing

                      // Horizontal Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // First Button
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "جاتوه",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8), // Spacing between buttons

                          // Second Button
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              "تورت",
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8), // Spacing between buttons

                          // Third Button with Border
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: AppColors.darkBlue),
                            ),
                            child: const Text(
                              "جميع الحلويات غريبة",
                              style: TextStyle(
                                color: AppColors.darkBlue,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BlocConsumer<DisplayProductsCubit, DisplayProductsState>(
                  buildWhen: (previous, current) =>
                      current is DisplayProductsSuccess ||
                      current is DisplayProductsFailure ||
                      current is DisplayProductsLoading,
                  listener: (context, state) {
                    if(state is DisplayProductsFailure){
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('An Error Occurred')),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is DisplayProductsLoading) {
                      return Expanded(
                          child: Container(
                              child: const Center(
                        child: CircularProgressIndicator(),
                      )));
                    }
                    if (state is DisplayProductsSuccess) {
                      var cubit = context.read<DisplayProductsCubit>();
                      return Expanded(
                        child: ListView.builder(
                          controller: scrollController
                            ..addListener(
                              () {
                                if (cubit.hasMore &&
                                    scrollController.position.pixels ==
                                        scrollController
                                            .position.maxScrollExtent) {
                                  // save request from multiple calls
                                  cubit.hasMore = false;

                                  cubit.getProducts(ProductRequest(
                                    pageNumber: (cubit.currentPage++),
                                    productsCountPerPage: 5,
                                  ));
                                }
                              },
                            ),
                          itemCount:
                              cubit.allItems.length + (state.isLoading ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == cubit.allItems.length) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            return ProductItem(
                              productName: cubit.allItems[index].name,
                              img: cubit.allItems[index].img,
                              price: cubit.allItems[index].price,
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
            BlocConsumer<DisplayProductsCubit, DisplayProductsState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                DisplayProductsCubit cubit =
                    context.read<DisplayProductsCubit>();
                return Positioned(
                    left: 10,
                    bottom: 300,
                    child: TapEffect(
                        onClick: () {
                          showCustomDialog(context, cubit);
                        },
                        child: RepaintBoundary(
                            child: CustomSvgImage(image: AppIcons.sort))));
              },
            )
          ],
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
