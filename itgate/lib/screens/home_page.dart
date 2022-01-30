import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/course_attendance.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        if(model.isUserLogin) {
          return Center(child: Loading());
        }else{
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              title: Text(
                  'Welcome ${model.userModel!.userName}',
                  style: primaryBlackFontStyle,
                ),
              backgroundColor: Colors.white,
            ),
            body: Container(
              margin: EdgeInsets.all(10.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: model.allStdCourses.length,
                itemBuilder: (context, index) {
                  if(model.isGetStdCoursesLoading) {
                    return Center(child: Loading());
                  }else if(model.allStdCourses.isEmpty) {
                    return Center(child: Text('Ops No Course Found', style: TextStyle(color: blackColor, fontSize: 30.0)));
                  }else{
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/logo.png'),
                      ),
                      title: Text(
                        '${model.allStdCourses[index].courseName}',
                        style: primaryBlackFontStyle,
                      ),
                      onTap: () {
                        model.getStdSelectedCourse(model.allStdCourses[index]);
                        model.checkAttendance(model.userModel!.id, model.allStdCourses[index].id!);
                        Navigator.push(context, MaterialPageRoute(builder: (_) {return CourseAttendance(model);}));
                      },
                    );
                  }
                },
              ),
            ),
          );
        }
      }
    );
  }
}