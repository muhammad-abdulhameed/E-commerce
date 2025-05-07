import 'package:dartz/dartz.dart';

import '../entities/BrandsListEntity.dart';
import '../entities/CategoriesListEntity.dart';

abstract class HomeRepo{
  Future<Either<String, CategoriesListEntity>> getAllCategories();
  Future<Either<String, BrandsListEntity>> getBrands();
}