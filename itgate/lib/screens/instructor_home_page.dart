import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/course_attendance.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/home_course_item.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:scoped_model/scoped_model.dart';




class InstructorHomePage extends StatefulWidget {

  @override
  _InstructorHomePageState createState() => _InstructorHomePageState();
}

class _InstructorHomePageState extends State<InstructorHomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        if (model.isGetInstructorCoursesLoading) {
          return Center(child: Loading());
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                  'Welcome ${model.instructorUserModel.userName}',
                  style: primaryBlackFontStyle,
                ),
              backgroundColor: Colors.white,
            ),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SafeArea(
                    top: true,
                    child: ListTile(
                      title: Text(
                        'Your Courses',
                        style: primaryBlackFontStyle,
                      ),
                      trailing: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: secondaryColor
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${model.allInstructorCourses.length}',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: ListView.builder(
                      itemCount: model.allInstructorCourses.length,
                      itemBuilder: (context, index) {
                        if (model.isGetInstructorCoursesLoading) {
                          return Center(child: Loading());
                        } else if (model.allInstructorCourses.isEmpty) {
                          return Center(child: Text('Ops No Course Found', style: TextStyle(color: blackColor, fontSize: 30.0)));
                        } else {
                          return HomeCourseItem(
                            model.allInstructorCourses[index].courseName!,
                            () {
                              model.getStdSelectedCourse(model.allInstructorCourses[index]);
                              model.getInstructorCourseAttendance(model.instructorUserModel.id!, model.allInstructorCourses[index].id!);
                              Navigator.push(context, MaterialPageRoute(builder: (_) {return CourseAttendance(model);}));
                            }
                          );
                        }
                      }
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}