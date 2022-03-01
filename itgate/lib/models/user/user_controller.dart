import 'package:itgate/models/shared.dart';
import 'package:itgate/models/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin UserController on Model {

  StudentUserModel stdModel = StudentUserModel(
    id: '', email: '', mobileNumber: '', nationalNumber: '', userName: ''
  );

  InstructorUserModel instructorUserModel = InstructorUserModel(
    email: '', id: '', mobileNumber: '', userName: ''
  );

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
        stdModel.id = _data[0]['st_id'];
        stdModel.userName = _data[0]['name'];
        stdModel.email= _data[0]['email'];
        stdModel.mobileNumber = _data[0]['national_id'];
        stdModel.nationalNumber = _data[0]['phone'];
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
        instructorUserModel.id = _data[0]['id_s'];
        instructorUserModel.userName = _data[0]['Name'];
        instructorUserModel.email = _data[0]['email'];
        instructorUserModel.mobileNumber = _data[0]['phone'];
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