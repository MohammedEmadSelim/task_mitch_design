import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mitch_designs_task/core/responsive/dimension.dart';
import 'package:mitch_designs_task/core/theme/colors.dart';
import 'package:mitch_designs_task/core/widgets/shimmer_avatat.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imgUrl,
    this.height = 50,
    this.width = 50,
  });

  final String imgUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(

      height: height!.h,
      width: width!.h,
      imageUrl: imgUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover, // Make sure the image covers the circle
          ),
          color: AppColors.blue,
        ),
        // child: Center(
        //   child: SpinKitDoubleBounce(
        //     color: AppColors.childBackgroundColor,
        //     size: 50.h,
        //   ),
        // ),
      ),
      placeholder: (context, url) => const ShimmerAvatar(),
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
          color: AppColors.blue.withOpacity(0.5),
          shape: BoxShape.circle, // Set to circle shape
        ),
        child: Icon(
          Icons.error,
          color: AppColors.light2Grey,
          size: 70.h,
        ),
      ),
    );
  }
}
