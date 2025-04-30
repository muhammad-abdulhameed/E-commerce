import '../../data/models/User.dart';


class AuthEntity {
  AuthEntity({
      this.user, 
      this.token,});

  User? user;
  String? token;


}