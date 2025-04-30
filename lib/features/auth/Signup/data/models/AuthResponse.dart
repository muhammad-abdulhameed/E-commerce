import 'package:my_ecommerce/features/auth/Signup/domain/entities/AuthEntity.dart';

import 'User.dart';

class AuthResponse {
  AuthResponse({
      this.message, 
      this.user, 
      this.token,
    this.statusMsg
  });

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg=json['statusMsg'];
  }
  String? message;
  User? user;
  String? token;
  String? statusMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }
  AuthEntity toAuthEntity()=> AuthEntity(token: token,user: user);
}