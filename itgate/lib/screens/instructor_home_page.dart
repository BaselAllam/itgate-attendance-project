import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/course_attendance.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';




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
                  'Welcome ${model.instructorUserModel!.userName}',
                  style: primaryBlackFontStyle,
                ),
              backgroundColor: Colors.white,
              actions: [
                IconButton(
                  icon: Icon(Icons.settings),
                  color: primaryColor,
                  iconSize: 30.0,
                  onPressed: () async {
                    SharedPreferences _shared = await SharedPreferences.getInstance();
                    _shared.clear();
                  },
                )
              ]
            ),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: model.allInstructorCourses.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/logo.png'),
                    ),
                    title: Text(
                      '${model.allInstructorCourses[index].courseName}',
                      style: primaryBlackFontStyle,
                    ),
                    onTap: () {
                      model.getStdSelectedCourse(model.allInstructorCourses[index]);
                      Navigator.push(context, MaterialPageRoute(builder: (_) {return CourseAttendance(model);}));
                    },
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}