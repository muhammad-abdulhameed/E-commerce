import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/core/connection_checker.dart';
import 'package:my_ecommerce/features/auth/SignIn/data/data_sources/signIn_data_Source.dart';
import 'package:my_ecommerce/features/auth/Signup/data/models/AuthResponse.dart';

import 'package:my_ecommerce/features/auth/Signup/domain/entities/AuthEntity.dart';

import '../../domain/repositories/signInRepo.dart';
@Injectable(as: SignInRepo)
class SignInRepoImpl implements SignInRepo{
  SignInDataSource dao;
  @factoryMethod
  SignInRepoImpl(this.dao);
  @override
  Future<Either<String, AuthEntity>> signIn(String mail,String password)async {
    bool isConnected=await ConnectionChecker.checkNetwork();
    if(isConnected){
      var result = await dao.signIn(mail, password);
      return result.fold((error) {
        return Left(error);
      }, (authResponse) {
        return Right(authResponse.toAuthEntity()) ;
      });
    }else{
      return const Left("No internet");
    }

  }

}