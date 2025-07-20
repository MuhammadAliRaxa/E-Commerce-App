import 'package:shared_preferences/shared_preferences.dart';

class SharedpreferancesHelper {
  static late SharedPreferences _prefs;
  static Future<void> makeInstance()async{
    _prefs=await SharedPreferences.getInstance();
  }
  static bool isBoardingDone(){
    return _prefs.getBool("isBoarding")??false;
  }
  static Future<void> setBoardingtoDone(bool bool)async{
    await _prefs.setBool("isBoarding", bool);
  }
  static bool isAccountLogin(){
    return _prefs.getBool("Login")??false;
  }
  static Future<void> setAccountAlreadyLogin(bool bool)async{
    await _prefs.setBool("Login", bool);
  }
}