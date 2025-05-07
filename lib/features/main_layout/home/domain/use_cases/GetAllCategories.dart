import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/repositories/home_repo.dart';

import '../entities/CategoriesListEntity.dart';
@injectable
class GetAllCategoriesUseCase{
HomeRepo _homeRepo;
GetAllCategoriesUseCase(this._homeRepo);
Future<Either<String, CategoriesListEntity>> call() =>  _homeRepo.getAllCategories();

}