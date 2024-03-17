import 'package:shared_preferences/shared_preferences.dart';


class DataController{

  static writeData(key,value) async {

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(key,value);
  }

  static Future<double?> readData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? v =  sharedPreferences.getDouble(key);
    return v;
  }



}