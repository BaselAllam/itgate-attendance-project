import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/take_attendance.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/attendance_widget.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:scoped_model/scoped_model.dart';



class CourseAttendance extends StatefulWidget {

  final MainModel model;

  CourseAttendance(this.model);

  @override
  _CourseAttendanceState createState() => _CourseAttendanceState();
}

class _CourseAttendanceState extends State<CourseAttendance> {

@override
void dispose() {
  widget.model.allAttendance.clear();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
                'Attendance',
                style: primaryBlackFontStyle,
              ),
              iconTheme: IconThemeData(color: secondaryColor, size: 20.0),
            backgroundColor: Colors.white,
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: secondaryColor,
            child: Icon(Icons.add, color: Colors.white, size: 20.0),
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(builder: (_) {return TakeAttendance();}));
            }
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          body: Container(
            margin: EdgeInsets.all(10.0),
            child: model.isGetAttendanceLoading ? Center(child: Loading()) : model.allAttendance.isEmpty ? Center(child: Text('Opps no Attendance Found')) : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.allAttendance.length,
              itemBuilder: (context, index) {
                return AttendanceWidget(model.allAttendance[index]);
              },
            ),
          ),
        );
      }
    );
  }
}