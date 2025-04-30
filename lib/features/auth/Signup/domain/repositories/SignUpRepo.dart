import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/Signup/data/models/AuthResponse.dart';

import '../entities/AuthEntity.dart';

abstract class SignupRepo{
  Future<Either<String,AuthEntity>> registerUser({required name,required email, required password,required rePassword,required phone});
}
