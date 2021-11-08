import 'package:shared_preferences/shared_preferences.dart';



class Shared{

  static final String domain = 'https://www.itgateacademy.com/TGA/hr';

  
  static Future<String> getSavedId(String key) async {

    String? _id;

    try{
      SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
      _sharedPreferences.getString('$key');

      return _id!;
    }catch(e) {
      return _id = '';
    }
  }

  static Future saveId(String key, String value) async {

    SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
    _sharedPreferences.setString('$key', '$value');

  }
}