import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/Remote/ApiManger.dart';
import 'package:my_ecommerce/core/Remote/EndPoints.dart';
import 'package:my_ecommerce/features/auth/Signup/data/models/AuthResponse.dart';

import '../SignupDataSource.dart';

@Injectable(as: SignUpDataSource)
class SignUpApiDataSourceImpl extends SignUpDataSource {
  ApiManger apiManger;

  @factoryMethod
  SignUpApiDataSourceImpl(
    this.apiManger,
  );

  @override
  Future<Either<String, AuthResponse>> registerUser(
      {required name,
      required email,
      required password,
      required rePassword,
      required phone}) async {
    try {
      //handle exceptions
      var response = await apiManger.postRequestRow(EndPoint.signUP, body: {
        "name": name,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone
      });
      //return response.data *it's return dynamic data (json ,xml,html..)in this case it return json *
      AuthResponse signupResponse = AuthResponse.fromJson(response.data);
      ///that's minor violate SRP cause fun call api and parse data
      //handle error response
      if (signupResponse.statusMsg!=null) {
        return Left(signupResponse.message!);
      } else {
        return Right(signupResponse);
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
