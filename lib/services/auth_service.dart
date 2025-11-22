import 'package:shared_preferences/shared_preferences.dart';

class AuthService{
  static String? userName;
  static String? userEmail;

  static Future<void> register(String name,String email,String pass) async {
    final prefs=await SharedPreferences.getInstance();
    prefs.setString("name", name);
    prefs.setString("email", email);
    prefs.setString("pass", pass);
  }

  static Future<bool> login(String email,String pass) async {
    final prefs=await SharedPreferences.getInstance();
    final e=prefs.getString("email");
    final p=prefs.getString("pass");
    if(email==e && pass==p){
      userName=prefs.getString("name");
      userEmail=prefs.getString("email");
      return true;
    }
    return false;
  }

  static Future<void> logout() async {
    userName=null;
    userEmail=null;
  }
}
