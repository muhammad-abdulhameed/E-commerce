import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
 static late SharedPreferences prefs;
static init()async{
   prefs = await SharedPreferences.getInstance();
 }
 static setToken(String token){
   prefs.setString("token", token);
 }
 static getToken(){
    return prefs.get("token");
 }
 static removeToken(){
  prefs.remove("token");
 }
}