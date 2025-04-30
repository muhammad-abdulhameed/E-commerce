import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/connection_checker.dart';
import 'package:my_ecommerce/features/auth/Signup/data/data_sources/SignupDataSource.dart';

import 'package:my_ecommerce/features/auth/Signup/data/models/AuthResponse.dart';

import '../../domain/entities/AuthEntity.dart';
import '../../domain/repositories/SignUpRepo.dart';
@Injectable(as:SignupRepo )
class SignupRepoImpl extends SignupRepo {
  SignUpDataSource signUpDataSource;
  @factoryMethod
  SignupRepoImpl(this.signUpDataSource);
  @override
  Future<Either<String, AuthEntity>> registerUser({required name,
    required email,
    required password,
    required rePassword,
    required phone}) async{
  bool isConnected=await  ConnectionChecker.checkNetwork();
    if(isConnected){
      var result=await signUpDataSource.registerUser(name: name, email: email, password: password, rePassword: rePassword, phone: phone);
      return result.fold((l) => Left(l), (r) => Right(r.toAuthEntity()));
    }else{
      return const Left("No internet");
    }

  }
}
