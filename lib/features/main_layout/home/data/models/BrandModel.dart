import 'package:my_ecommerce/features/main_layout/home/domain/entities/BrandEntity.dart';

class BrandModel {
  BrandModel({
      this.id, 
      this.brandName, 
      this.logoUrl, 
      this.description,});

  BrandModel.fromJson(dynamic json) {
    id = json['id'];
    brandName = json['brand_name'];
    logoUrl = json['logo_url'];
    description = json['description'];
  }
  num? id;
  String? brandName;
  String? logoUrl;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['brand_name'] = brandName;
    map['logo_url'] = logoUrl;
    map['description'] = description;
    return map;
  }
  BrandEntity toBrandEntity(){
    return BrandEntity(id: id,brandName: brandName,logoUrl: logoUrl);
  }

}