import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/Signup/domain/entities/AuthEntity.dart';

abstract class SignInRepo{
 Future<Either<String,AuthEntity>> signIn(String mail,String password);
}