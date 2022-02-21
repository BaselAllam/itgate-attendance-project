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

  bool _isGetInstructorCoursesLoading = false;
  bool get isGetInstructorCoursesLoading => _isGetInstructorCoursesLoading;

  List<CourseModel> _allStdCourses = [];
  List<CourseModel> get allStdCourses => _allStdCourses;

  List<CourseModel> _allInstructorCourses = [];
  List<CourseModel> get allInstructorCourses => _allInstructorCourses;


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

  CourseModel? selectedCourse;

  getStdSelectedCourse(CourseModel course) {
    selectedCourse = course;
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

      String _savedValue = await Shared.getSavedId('courseOrDiploma');

      _data.forEach((i) {
        CourseModel _newCourse = CourseModel(
          courseName: _savedValue == 'course' ? i['Name'] : i['coursename'],
          id: _savedValue == 'course' ? i['course_id'] : i['id']
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


  Future<bool> getInstructorCourses(String userId) async {

    _isGetInstructorCoursesLoading = true;
    notifyListeners();

    try{

      print(userId);

      http.Response _res = await http.get(
        Uri.parse('${Shared.domain}/inscourse.php?app_id=${userId.trim()}'),
      );

      var _data = json.decode(_res.body);

      print(_data);

      _data.forEach((i) {
        CourseModel _newCourse = CourseModel(
          courseName: i['Name'],
          id: i['id']
        );
        _allInstructorCourses.add(_newCourse);
      });

      _isGetInstructorCoursesLoading = false;
      notifyListeners();
      return true;
    }catch(e) {
      _isGetInstructorCoursesLoading = false;
      notifyListeners();
      return false;
    }
  }
}