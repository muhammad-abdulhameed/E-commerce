import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/resources/constants_manager.dart';
@singleton
class ApiManger{
  Dio mockDio=Dio(BaseOptions(baseUrl: AppConstants.mockBaseUrl,validateStatus:(statusCode){
    if((statusCode!>=200&&statusCode<300)|| statusCode==409||statusCode==401 ){
      return true;
    }else{
      return false;
    }
  }));
  Dio _dio=Dio(BaseOptions(baseUrl: AppConstants.baseUrl,validateStatus:(statusCode){
    if((statusCode!>=200&&statusCode<300)|| statusCode==409||statusCode==401 ){
      return true;
    }else{
      return false;
    }
  }));

  ApiManger();
  Future<Response> getRequest(String path, {Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}){
   return _dio.get(path,queryParameters:queryParameters,options: Options(headers: headers) );
  }
  Future<Response>postRequestRow(String path, {Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers,Map<String, dynamic>? body}){
  return  _dio.post(path,data:body,queryParameters: queryParameters,options: Options(headers: headers) );
  }
  Future<Response> postRequestFormData(String path, {Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers,required Map<String, dynamic> body}){
   return _dio.post(path,data: FormData.fromMap(body));
  }
  Future<Response> deleteRequest(String path,Map<String, dynamic>? headers){
   return _dio.delete(path,options: Options(headers: headers ));
    }
    putRequest(String path, {Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers,Map<String, dynamic>? body}){
    return _dio.put(path,queryParameters: queryParameters,data: body,options: Options(headers: headers));
    }
  Future<Response> mockGetRequest(String path, {Map<String, dynamic>? queryParameters,Map<String, dynamic>? headers}){
    return mockDio.get(path,queryParameters:queryParameters,options: Options(headers: headers) );
  }
}