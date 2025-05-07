import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce/core/Utils/DialogUtils.dart';
import 'package:my_ecommerce/core/di/DiSetup.dart';
import 'package:my_ecommerce/core/resources/values_manager.dart';
import 'package:my_ecommerce/features/main_layout/home/presentation/manager/home_view_model_cubit.dart';
import 'package:my_ecommerce/features/main_layout/home/presentation/widgets/custom_brand_widget.dart';

import '../../../../../../core/resources/assets_manager.dart';

import '../widgets/custom_ads_widget.dart';
import '../widgets/custom_category_widget.dart';
import '../widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
   /* getIt.get<HomeViewModelCubit>()..getCategories()..getBrands();*/
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeViewModelCubit>()..getCategories()..getBrands(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAdsWidget(
              adsImages: adsImages,
              currentIndex: _currentIndex,
              timer: _timer,
            ),
            Column(
              children: [
                CustomSectionBar(sectionNname: 'Categories', function: () {}),
                SizedBox(
                  height: 270.h,
                  child: BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
                    buildWhen: (previous, current) {
                      if (current is HomeCategoriesSuccessState ||
                          current is HomeCategoriesErrorState ||
                          current is HomeCategoriesLoadingState) {
                        return true;
                      }
                      return false;
                    },
                    builder: (context, state) {
                      if (state is HomeCategoriesSuccessState) {
                        return GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CustomCategoryWidget(
                                state.categoryListEntity.data![index]);
                          },
                          itemCount: state.categoryListEntity.data?.length ?? 0,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    listener: (BuildContext context, HomeViewModelState state) {
                      if (state is HomeCategoriesErrorState) {
                        Utils.showStateDialog(context, state.errorMessage);
                      }
                    },
                  ),
                ),
                // SizedBox(height: 12.h),
                // CustomSectionBar(sectionNname: 'Brands', function: () {}),
                // SizedBox(
                //   height: 270.h,
                //   child: GridView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       return const CustomBrandWidget();
                //     },
                //     itemCount: 20,
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 2,
                //     ),
                //   ),
                // ),
                // CustomSectionBar(
                //   sectionNname: 'Most Selling Products',
                //   function: () {},
                // ),
                // SizedBox(
                //   child: SizedBox(
                //     height: 360.h,
                //     child: ListView.builder(
                //       scrollDirection: Axis.horizontal,
                //       itemBuilder: (context, index) {
                //         return const ProductCard(
                //           title: "Nike Air Jordon",
                //           description:
                //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                //           rating: 4.5,
                //           price: 1100,
                //           priceBeforeDiscound: 1500,
                //           image: ImageAssets.categoryHomeImage,
                //         );
                //       },
                //       itemCount: 20,
                //     ),
                //   ),
                // ),
                SizedBox(height: 12.h),
                CustomSectionBar(sectionNname: "Brands", function: () {}),
                SizedBox(height: 12.h),
                BlocConsumer<HomeViewModelCubit, HomeViewModelState>(
                  buildWhen: (previous, current) {
                    if (previous is HomeCategoriesSuccessState &&
                            current is HomeBrandsLoadingState ||
                        current is HomeBrandsErrorState ||
                        current is HomeBrandsSuccessState) {
                      return true;
                    }
                    return false;
                  },
                  builder: (context, state) {
                    if(state is HomeBrandsSuccessState){
                      print(state.brandsListEntity.brandEntityList?[0]);
                    return SizedBox(
                      height: 211.h,
                      width: 414.w,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1),
                        itemBuilder: (context, index) {
                          return  CustomBrandWidget(state.brandsListEntity.brandEntityList![index]);
                        },
                        itemCount: state.brandsListEntity.brandEntityList?.length??0,
                      ),
                    );}else {
                          return const Center(child: CircularProgressIndicator(),);
                    }
                  }, listener: (BuildContext context, HomeViewModelState state) {
                    if (state is HomeBrandsErrorState){
                      Utils.showStateDialog(context, state.errorMessage);
                    }
                },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
