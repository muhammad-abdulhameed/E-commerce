import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/main_layout/home/data/models/BrandsResponse.dart';

import '../models/CategoriesResponse.dart';

abstract class HomeDao{
   Future<Either<String ,CategoriesResponse>> getAllCategories();
   Future<Either<String ,BrandsResponse>> getBrands();
}