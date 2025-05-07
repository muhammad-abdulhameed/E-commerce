import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/connection_checker.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/entities/BrandsListEntity.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/entities/CategoriesListEntity.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/repositories/home_repo.dart';


import '../data_sources/home_dao.dart';
@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo{
  HomeDao dao ;
  HomeRepoImpl(this.dao);
  @override
  Future<Either<String, CategoriesListEntity>> getAllCategories() async{
bool isConnected= await ConnectionChecker.checkNetwork();
if (isConnected){
  var result=await dao.getAllCategories();
  return result.fold((error) {
    return Left(error);
  }, (categoriesResponse) {
    return Right(categoriesResponse.toCategoriesListEntity());
  });

}else{
  return const Left("No internet connection");
}
  }

  @override
  Future<Either<String, BrandsListEntity>> getBrands()async {
  bool isConnected=await ConnectionChecker.checkNetwork();
    if(isConnected){
      var result=await dao.getBrands();
      return result.fold((error) {
        return Left(error);
      }, (entity) {
        return Right(entity.toBrandsListEntity()) ;
      });
    }else{
      return Left("Please Check your internet");
    }
  }
}