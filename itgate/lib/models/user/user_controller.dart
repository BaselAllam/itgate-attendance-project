import 'package:itgate/models/shared.dart';
import 'package:itgate/models/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin UserController on Model{


  bool _isUserLogin = false;
  bool get isUserLogin => _isUserLogin;

  bool _isInstructorUserLogin = false;
  bool get isInstructorUserLogin => _isInstructorUserLogin;

  StudentUserModel? userModel;

  InstructorUserModel? instructorUserModel;

  bool? instructorOrStudent;

  Future<bool> studentLogin(String userId) async {

    _isUserLogin = true;
    notifyListeners();

    try{
      Map<String, dynamic> _senderData = {
      'user_ID' : userId
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/studentt.php'),
        body: _senderData
      );

      var _data = json.decode(_res.body);
      if(_data == 'Wrong ID') {
        _isUserLogin = false;
        notifyListeners();
        return false;
      }else{
        await Shared.saveId('id', userId);
        await Shared.saveId('instructor', 'false');
        instructorOrStudent = false;
        userModel = StudentUserModel(
          id: _data[0]['st_id'],
          userName: _data[0]['name'],
          email: _data[0]['email'],
          nationalNumber: _data[0]['national_id'],
          mobileNumber: _data[0]['phone'],
        );
        _isUserLogin = false;
        notifyListeners();
        return true;
      }
    }catch(e){
      _isUserLogin = false;
      notifyListeners();
      return false;
    }
  }


  Future<bool> instructorLogin(String userId) async {

    _isInstructorUserLogin = true;
    notifyListeners();

    try{
      Map<String, dynamic> _senderData = {
      'user_ID' : userId
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/inslogin.php'),
        body: _senderData
      );

      var _data = json.decode(_res.body);
      if(_data == 'Wrong ID') {
        _isInstructorUserLogin = false;
        notifyListeners();
        return false;
      }else{
        await Shared.saveId('id', userId);
        await Shared.saveId('instructor', 'true');
        instructorOrStudent = true;
        instructorUserModel = InstructorUserModel(
          id: _data[0]['id_s'],
          userName: _data[0]['Name'],
          email: _data[0]['email'],
          mobileNumber: _data[0]['phone'],
        );
        _isInstructorUserLogin = false;
        notifyListeners();
        return true;
      }
    }catch(e){
      _isInstructorUserLogin = false;
      notifyListeners();
      return false;
    }
  }
}