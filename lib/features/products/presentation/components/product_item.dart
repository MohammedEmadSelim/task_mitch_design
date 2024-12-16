import 'package:flutter/material.dart';
import 'package:mitch_designs_task/core/constants/icons.dart';
import 'package:mitch_designs_task/core/responsive/dimension.dart';
import 'package:mitch_designs_task/core/theme/colors.dart';
import 'package:mitch_designs_task/core/widgets/chache_network_image.dart';
import 'package:mitch_designs_task/core/widgets/custom_svg.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final String img;
  final String price;
  const ProductItem({
    super.key,
    required this.productName,
    required this.img,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               Text(
                productName,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                '250 جم',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.grey),
              ),
              Row(
                children: [
                  const Text(
                    '8-7 أفراد',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.grey),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomSvgImage(
                    image: AppICons.people,
                  ),
                ],
              ),
              SizedBox(
                height: 7.h,
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                    child: Row(
                      children: [
                        const Text(
                          '50 نقطة',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.green),
                        ),
                        SizedBox(width: 4.w),
                        CustomSvgImage(image: AppICons.stars),
                      ],
                    ),
                  ),
                  SizedBox(width: 10.w),
                   Text(
                    'EGP $price',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            child: CustomCachedNetworkImage(
              imgUrl:img,
              width: 200.w,
              height: 200.h,
            ),
          ),

        ],
      ),
    );
  }
}
