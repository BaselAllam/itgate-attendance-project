import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/attendance_widget.dart';



class CourseAttendance extends StatefulWidget {

  @override
  _CourseAttendanceState createState() => _CourseAttendanceState();
}

class _CourseAttendanceState extends State<CourseAttendance> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Attendance | Cyber Security',
            style: primaryBlackFontStyle,
          ),
          iconTheme: IconThemeData(color: secondaryColor, size: 20.0),
        backgroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        child: Icon(Icons.add, color: Colors.white, size: 20.0),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 5,
          itemBuilder: (context, index) {
            return AttendanceWidget();
          },
        ),
      ),
    );
  }
}