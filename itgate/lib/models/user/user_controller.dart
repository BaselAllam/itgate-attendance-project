import 'package:itgate/models/shared.dart';
import 'package:itgate/models/user/user_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin UserController on Model{


  bool _isUserLogin = false;
  bool get isUserLogin => _isUserLogin;

  UserModel? userModel;

  Future<bool> login(String userId) async {

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
        Shared.saveId('id', userId);
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
}


// List<CourseModel> runningCourses;
// List<CourseModel> endedCourse;
// List<Attendance> courseAttendance