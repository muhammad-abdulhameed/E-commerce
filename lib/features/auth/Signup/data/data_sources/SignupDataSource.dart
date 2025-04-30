import 'package:dartz/dartz.dart';
import 'package:my_ecommerce/features/auth/Signup/data/models/AuthResponse.dart';

abstract class SignUpDataSource{
 Future< Either<String,AuthResponse> > registerUser({required name,required email, required password,required rePassword,required phone});
}