import 'package:itgate/models/attendance/attendance_model.dart';
import 'package:itgate/models/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin AttendanceController on Model{

  bool _isGetAttendanceLoading = false;
  bool get isGetAttendanceLoading => _isGetAttendanceLoading;

  List<AttendanceModel> _allAttendance = [];
  List<AttendanceModel> get allAttendance => _allAttendance;

  bool _isBluetoothScaning = false;
  bool get isBluetoothScaning => _isBluetoothScaning;


  checkAttendance(String userId, String courseId) async {

    _isGetAttendanceLoading = true;
    notifyListeners();

    String _diplomaOrCourse = await Shared.getSavedId('courseOrDiploma');

    if(_diplomaOrCourse == 'course') {
      await getCourseAttendance(userId, courseId);
    }else{
      await getDiplomaAttendance(userId, courseId);
    }

     _isGetAttendanceLoading = false;
      notifyListeners();
  }

  Future<bool> getDiplomaAttendance(String userId, String courseId) async {

    try{
      Map<String, dynamic> _sendingData = {
        'diploma_course' : courseId,
        'app_id' : userId,
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/all_attenddiploma.php'),
        body: _sendingData
      );

      List _data = json.decode(_res.body);

      _data.forEach((i) {
        AttendanceModel _newAttendance = AttendanceModel(
          id: i['id'],
          day: i['day'],
          date: i['date'],
          goin: i['goin'],
          goout: i['goout']
        );
        _allAttendance.add(_newAttendance);
      });
      return true;
    }catch(e) {
      return false;
    }
  }

  Future<bool> getCourseAttendance(String userId, String courseId) async {

    try{
      Map<String, dynamic> _sendingData = {
        'course_id' : courseId,
        'app_id' : userId,
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/all_attendcourse.php'),
        body: _sendingData
      );

      List _data = json.decode(_res.body);

      _data.forEach((i) {
        AttendanceModel _newAttendance = AttendanceModel(
          id: i['id'],
          day: i['day'],
          date: i['date'],
          goin: i['goin'],
          goout: i['goout']
        );
        _allAttendance.add(_newAttendance);
      });
      return true;

    }catch(e) {
      return false;
    }
  }
}

// TGA-2100199