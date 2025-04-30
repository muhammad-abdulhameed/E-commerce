import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/Remote/ApiManger.dart';
import 'package:my_ecommerce/core/Remote/EndPoints.dart';
import 'package:my_ecommerce/features/auth/SignIn/data/data_sources/signIn_data_Source.dart';
import 'package:my_ecommerce/features/auth/Signup/data/models/AuthResponse.dart';
@Injectable(as: SignInDataSource)
class SignInDataSourceApiImpl implements SignInDataSource {
  ApiManger apiManger;
@factoryMethod
  SignInDataSourceApiImpl(this.apiManger);

  @override Future<Either<String, AuthResponse>> signIn(String mail,
      String password) async {
    try {
      var response = await apiManger.postRequestRow(EndPoint.signIn, body: {
        "email": mail,
        "password": password
      });
      AuthResponse signInResponse = AuthResponse.fromJson(response.data);
      if (signInResponse.statusMsg != null) {
        return Left(signInResponse.message!);
      } else {
        return Right(signInResponse);
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}