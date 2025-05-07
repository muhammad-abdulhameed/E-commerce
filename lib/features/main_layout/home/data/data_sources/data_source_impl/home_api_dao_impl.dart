import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/Remote/ApiManger.dart';
import 'package:my_ecommerce/core/Remote/EndPoints.dart';

import 'package:my_ecommerce/features/main_layout/home/data/models/BrandsResponse.dart';
import 'package:my_ecommerce/features/main_layout/home/data/models/CategoriesResponse.dart';


import '../home_dao.dart';
@Injectable(as: HomeDao)
class HomeApiDaoImpl implements HomeDao{
  ApiManger apiManger;
  @factoryMethod
  HomeApiDaoImpl(this.apiManger);
  @override
  Future<Either<String ,CategoriesResponse>> getAllCategories({int? limit,int? page })async {
   try{
     var response= await apiManger.getRequest(EndPoint.getAllCategories,queryParameters: {
       "limit":limit,
       "page":page,
     });
     CategoriesResponse categoriesResponse=CategoriesResponse.fromJson(response.data);
     if(categoriesResponse.data==null){
        return const Left("There's no products in this category");
     }else if(categoriesResponse.statusMsg!=null){
       return Left(categoriesResponse.message!);
     }else{
       return Right(categoriesResponse);
     }
   }catch(e){
return Left(e.toString());
   }

  }

  @override
  Future<Either<String, BrandsResponse>> getBrands()async {
try{
  var response =await  apiManger.mockGetRequest(EndPoint.getAllBrands);
  BrandsResponse brandsResponse =BrandsResponse.fromJson(response.data);
  if(brandsResponse.brandsModel==null){
    return const Left("sorry there's somme thing went wrong");
  }else {
    return Right(brandsResponse);
  }

}catch(e){
  return Left(e.toString());
}
  }
}