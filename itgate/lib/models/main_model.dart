import 'package:itgate/models/about/aboutcontroller.dart';
import 'package:itgate/models/courses/course_controllers.dart';
import 'package:itgate/models/user/user_controller.dart';
import 'package:scoped_model/scoped_model.dart';



class MainModel extends Model with AboutController, CoursesController, UserController{}