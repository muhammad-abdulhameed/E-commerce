import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_ecommerce/features/auth/Signup/domain/repositories/SignUpRepo.dart';

import '../entities/AuthEntity.dart';
@injectable
class SignupUseCase{
  SignupRepo signupRepo;
  SignupUseCase(this.signupRepo);
  Future<Either<String, AuthEntity>> call({required name,required email, required password,required rePassword,required phone}){
 return signupRepo.registerUser(name: name, email: email, password: password, rePassword: rePassword, phone: phone);
}
}