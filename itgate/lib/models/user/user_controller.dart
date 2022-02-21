import 'package:itgate/models/shared.dart';
import 'package:itgate/models/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin UserController on Model{

  StudentUserModel? stdModel;

  InstructorUserModel? instructorUserModel;

  bool _isUserLogin = false;
  bool get isUserLogin => _isUserLogin;

  bool _isInstructorUserLogin = false;
  bool get isInstructorUserLogin => _isInstructorUserLogin;

  Future<bool> studentLogin(String userId) async {

    _isUserLogin = true;
    notifyListeners();

    try {
      Map<String, dynamic> _senderData = {
      'user_ID' : userId
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/studentt.php'),
        body: _senderData
      );

      var _data = json.decode(_res.body);
      
      if (_data == 'Wrong ID') {
        _isUserLogin = false;
        notifyListeners();
        return false;
      } else {
        await Shared.saveId('id', userId);
        await Shared.saveId('instructor', 'false');
        stdModel = StudentUserModel(
          _data[0]['st_id'],
          _data[0]['name'],
          _data[0]['email'],
          _data[0]['national_id'],
          _data[0]['phone'],
        );
        UserModel.isStudent = true;
        _isUserLogin = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _isUserLogin = false;
      notifyListeners();
      return false;
    }
  }


  Future<bool> instructorLogin(String userId) async {

    _isInstructorUserLogin = true;
    notifyListeners();

    try {
      Map<String, dynamic> _senderData = {
      'user_ID' : userId
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/inslogin.php'),
        body: _senderData
      );

      var _data = json.decode(_res.body);

      if (_data == 'Wrong ID') {
        _isInstructorUserLogin = false;
        notifyListeners();
        return false;
      } else {
        instructorUserModel = InstructorUserModel(
          _data[0]['id_s'],
          _data[0]['Name'],
          _data[0]['email'],
          _data[0]['phone'],
        );
        await Shared.saveId('id', userId);
        await Shared.saveId('instructor', 'true');
        UserModel.isStudent = false;
        _isInstructorUserLogin = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      _isInstructorUserLogin = false;
      notifyListeners();
      return false;
    }
  }
}