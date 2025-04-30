import 'package:dartz/dartz.dart';

import '../../../Signup/data/models/AuthResponse.dart';

abstract class SignInDataSource{
 Future<Either<String ,AuthResponse>> signIn(String mail ,String password);
}