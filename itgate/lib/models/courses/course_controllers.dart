import 'package:itgate/models/courses/courses_model.dart';
import 'package:itgate/models/shared.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


mixin CoursesController on Model{

  bool _isGetCoursesLoading = false;
  bool get isGetCoursesLoading => _isGetCoursesLoading;

  List<CourseModel> _allCourses = [];
  List<CourseModel> get allCourses => _allCourses;

  bool _isGetStdCoursesLoading = false;
  bool get isGetStdCoursesLoading => _isGetStdCoursesLoading;

  List<CourseModel> _allStdCourses = [];
  List<CourseModel> get allStdCourses => _allStdCourses;


  Future<bool> getAllCourses() async {

    _isGetCoursesLoading = true;
    notifyListeners();

    try{
      http.Response _res = await http.get(Uri.parse('${Shared.domain}/getcourse.php'));

      List _data = json.decode(_res.body);
      
      _data.forEach((i) {
        CourseModel _newCourse = CourseModel(
          courseName: i['cour'],
          courseImg: i['Image'],
          coursePrice: i['Price'].toString(),
          courseHours: i['Hours'].toString(),
          courseDescription: i['Description'],
          online: i['online'] == '1' ? 'Online' : 'Offline'
        );
        _allCourses.add(_newCourse);
      });

      _isGetCoursesLoading = false;
      notifyListeners();
      return true;
    }catch(e) {
      _isGetCoursesLoading = false;
      notifyListeners();
      return false;
    }
  }



  Future<bool> getStdCourses(String userId) async {

    _isGetStdCoursesLoading = true;
    notifyListeners();

    try{

      Map<String, dynamic> _senderData = {
      'app_id' : userId.trim()
      };

      http.Response _res = await http.post(
        Uri.parse('${Shared.domain}/all_courses.php'),
        body: _senderData
      );

      List _data = json.decode(_res.body);

      _data.forEach((i) {
        CourseModel _newCourse = CourseModel(
          courseName: i['coursename'],
          id: i['id']
        );
        _allStdCourses.add(_newCourse);
      });

      _isGetStdCoursesLoading = false;
      notifyListeners();
      return true;
    }catch(e) {
      _isGetStdCoursesLoading = false;
      notifyListeners();
      return false;
    }
  }
}