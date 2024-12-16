import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitch_designs_task/core/api_service/requestModels/product_request.dart';
import 'package:mitch_designs_task/core/theme/colors.dart';
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
        ..getProducts(ProductRequest(pageNamber: 1, ProductsCountPerPage: 5)),
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
                    print("Location dropdown tapped");
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BlocConsumer<DisplayProductsCubit, DisplayProductsState>(
              listener: (context, state) {},
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
                            if (cubit.isLoading &&
                                (scrollController.position.pixels ==
                                    scrollController
                                        .position.maxScrollExtent)) {
                              // cubit.getProducts(product);
                            }
                          },
                        ),
                      itemCount: cubit.allItems.length + 1,
                      itemBuilder: (context, index) {
                        if (index == cubit.allItems.length) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }

                        return const ProductItem(
                          productName: 'mmmm',
                          img:
                              'https://stg.koueider.com/wp-content/uploads/2024/01/4016042-thumb.jpg',
                          price: 20,
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
        bottomNavigationBar: const CustomBottomNavigationBar(),
      ),
    );
  }
}
