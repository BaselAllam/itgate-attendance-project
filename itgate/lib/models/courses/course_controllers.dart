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
}