import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper{
  static SharedPreferences? _sharedPreferences;
  static init() async=> _sharedPreferences = await SharedPreferences.getInstance();
  static setString(key,value)=> _sharedPreferences!.setString(key, value);
  static String? getString(key)=>_sharedPreferences!.getString(key);
}