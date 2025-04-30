import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/features/auth/SignIn/domain/repositories/signInRepo.dart';

import '../../../Signup/domain/entities/AuthEntity.dart';
@injectable
class SignInUseCase{
  SignInRepo signInRepo;
  SignInUseCase(this.signInRepo);
  Future<Either<String, AuthEntity>> call(String mail ,String password){
   return signInRepo.signIn(mail, password);
  }
}