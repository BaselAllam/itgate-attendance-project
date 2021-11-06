import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';



class AttendanceWidget extends StatefulWidget {

  @override
  _AttendanceWidgetState createState() => _AttendanceWidgetState();
}

class _AttendanceWidgetState extends State<AttendanceWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[300]
      ),
      child: Row(
        children: [
          Container(
            height: 100.0,
            width: 80.0,
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            alignment: Alignment.center,
            child: Text(
              '12 Nov\n2021',
              textAlign: TextAlign.center,
              style: TextStyle(color: blackColor, fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ),
          Container(
            width: MediaQuery.of(context).size.width - 140,
            child: ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Text(
                  'Check In      Check Out',
                  style: primaryBlackFontStyle,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                child: Text(
                  ' 6:00 PM          10:00 PM',
                  style: secondaryTextStyle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}