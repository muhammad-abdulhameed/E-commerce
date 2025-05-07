import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_ecommerce/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/entities/BrandEntity.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class CustomBrandWidget extends StatelessWidget {
   CustomBrandWidget(this.brandEntity,{super.key});
BrandEntity brandEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.r),
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: SvgPicture.network(
               brandEntity.logoUrl??'',//ImageAssets.brandHomeImage,
              fit: BoxFit.scaleDown,
            ),

          ),
        ),
        Text(brandEntity.brandName??"mkajkjhasdkhia", style: getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),)
      ],
    );
  }
}


        // CachedNetworkImage(
        //   height: 80,
        //   width: 80,
        //   fit: BoxFit.cover,
        //   imageUrl: ImageAssets.categoryHomeImage,
        //   placeholder: (context, url) =>
        //       const Center(child: CircularProgressIndicator()),
        //   errorWidget: (context, url, error) =>
        //       const Center(child: Icon(Icons.error)),
        //   imageBuilder: (context, imageProvider) {
        //     return Container(
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         image: DecorationImage(
        //           image: imageProvider,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   },
        // ),