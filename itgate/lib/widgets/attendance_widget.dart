import 'package:flutter/material.dart';
import 'package:itgate/models/attendance/attendance_model.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';



class AttendanceWidget extends StatefulWidget {

  final AttendanceModel attendanceModel;

  AttendanceWidget(this.attendanceModel);

  @override
  _AttendanceWidgetState createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0, top: 20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey[300]
      ),
      child: ListTile(
        leading: Icon(Icons.watch_later, color: secondaryColor, size: 25),
        title: Text(
          '${widget.attendanceModel.date} | ${widget.attendanceModel.day} :',
          style: secondaryTextStyle
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Check In  ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.normal
              ),
            ),
            Text(
              '${widget.attendanceModel.goin}   |   ',
              style: TextStyle(
                fontSize: 15,
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              'Check Out  ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.normal
              ),
            ),
            Text(
              '${widget.attendanceModel.goout}',
              style: TextStyle(
                fontSize: 15,
                color: primaryColor,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}