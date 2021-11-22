import 'package:geolocator/geolocator.dart';
import 'package:itgate/models/attendance/attendance_model.dart';
import 'package:itgate/models/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin AttendanceController on Model{

  bool _isGetAttendanceLoading = false;
  bool get isGetAttendanceLoading => _isGetAttendanceLoading;

  bool _isValidateLocationLoading = false;
  bool get isValidateLocationLoading => _isValidateLocationLoading;

  bool _isGetCurrentPositionLoading = false;
  bool get isGetCurrentPositionLoading => _isGetCurrentPositionLoading;

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


  Future<bool> _validateLocation(double lat, double long) async {

    _isValidateLocationLoading = true;
    notifyListeners();

    try{
      
      Map<String, dynamic> _sendingData = {
        'long' : '$long',
        'lat' : '$lat'
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/location.php'),
        body: _sendingData
      );

      var _data = json.decode(_res.body);

      if(_data['response'] == 'invalid') {
        _isValidateLocationLoading = false;
        notifyListeners();
        return false;
      }else{
        _isValidateLocationLoading = false;
        notifyListeners();
        return true;
      }

    }catch(e) {
      _isValidateLocationLoading = false;
      notifyListeners();
      return false;
    }

  }


  Future<int> getCurrentPosition() async {

    // 0 => all done
    // 1 => no permission
    // 2 => service disabled
    // 3 => catch
    // 4 => location incorrect

    _isGetCurrentPositionLoading = true;
    notifyListeners();

    try{
      LocationPermission _permission = await Geolocator.checkPermission();
      bool _serviceEnabled = await Geolocator.isLocationServiceEnabled();
      Position _currentPosition = await Geolocator.getCurrentPosition();

      if(_permission == LocationPermission.denied) {
        Geolocator.requestPermission();
        _isGetCurrentPositionLoading = false;
        notifyListeners();
        return 1;
      }else if(_serviceEnabled == false) {
        _isGetCurrentPositionLoading = false;
        notifyListeners();
        return 2;
      }else{
        bool _verifyLocation = await _validateLocation(30.0444, 31.2357);
        if(_verifyLocation) {
          _isGetCurrentPositionLoading = false;
          notifyListeners();
          return 0;
        }else{
          _isGetCurrentPositionLoading = false;
          notifyListeners();
          return 4;
        }
      }

    }catch(e) {
      _isGetAttendanceLoading = false;
      notifyListeners();
      return 3;
    }
  }
}