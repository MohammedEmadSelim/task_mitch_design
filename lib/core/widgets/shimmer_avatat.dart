import 'package:flutter/material.dart';
import 'package:mitch_designs_task/core/theme/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAvatar extends StatelessWidget {
  const ShimmerAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.light2Grey,
      highlightColor: AppColors.grey,
      enabled: true,
      period: const Duration(milliseconds: 1000),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.light2Grey,

        ),

      ),
    );
  }
}
