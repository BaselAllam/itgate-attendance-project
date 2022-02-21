import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';



class HomeCourseItem extends StatefulWidget {

  final String courseName;
  final Function onTap;

  HomeCourseItem(this.courseName, this.onTap);
  

  @override
  _HomeCourseItemState createState() => _HomeCourseItemState();
}

class _HomeCourseItemState extends State<HomeCourseItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      margin: EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                  fit: BoxFit.fill
                )
              ),
            ),
            ListTile(
              title: Text(
                '${widget.courseName}',
                style: primaryBlackFontStyle,
              ),
              subtitle: Text(
                'Click to Check your attendance and take a new attendance',
                style: subTextStyle,
              ),
              trailing: Container(
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle
                ),
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.arrow_forward, color: Colors.white, size: 20.0),
              ),
              onTap: () {
                widget.onTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}