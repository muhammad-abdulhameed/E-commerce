import 'package:my_ecommerce/features/main_layout/home/domain/entities/CategoriesListEntity.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/entities/CategoryEntity.dart';

import 'CategoryModel.dart';
import 'Metadata.dart';


class CategoriesResponse {
  CategoriesResponse({
    this.results,
    this.message,
    this.statusMsg,
    this.metadata,
    this.data,
  });

  CategoriesResponse.fromJson(dynamic json) {
    statusMsg = json['statusMsg'];
    message = json['message'];
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CategoryModel.fromJson(v));
      });
    }
  }

  num? results;
  Metadata? metadata;
  List<CategoryModel>? data;
  String? statusMsg;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    statusMsg = map['statusMsg'];
    message = map['message'];

    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  CategoriesListEntity toCategoriesListEntity() {
   return CategoriesListEntity(
        data: data!.map((categoryModel) =>categoryModel.toCategoryEntity() )
            .toList());
  }
}
