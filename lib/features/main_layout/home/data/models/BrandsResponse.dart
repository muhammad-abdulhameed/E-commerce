import 'package:my_ecommerce/features/main_layout/home/domain/entities/BrandsListEntity.dart';

import 'BrandModel.dart';

class BrandsResponse{
  List<BrandModel>? brandsModel;
 BrandsResponse(
     this.brandsModel
     ) ;
 BrandsResponse.fromJson(json){
   if(json['data']!=null){
     brandsModel=[];
     json['data'].forEach((v) {
       brandsModel?.add(BrandModel.fromJson(v));
     });
   }
 }
  BrandsListEntity toBrandsListEntity(){
  return BrandsListEntity(
     brandEntityList: brandsModel?.map((e) =>e.toBrandEntity() ).toList()
   );
 }
}