import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/repositories/home_repo.dart';

import '../entities/BrandsListEntity.dart';
@injectable
class GetBrandsUseCase{
  HomeRepo repo;
  GetBrandsUseCase(this.repo);
  Future<Either<String, BrandsListEntity>> call()=> repo.getBrands();
}