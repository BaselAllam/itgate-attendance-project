import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/item.dart';




class OurCourses extends StatefulWidget {

  @override
  _OurCoursesState createState() => _OurCoursesState();
}

class _OurCoursesState extends State<OurCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Our Offers',
            style: primaryBlackFontStyle,
          ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return CourseItem(
              'Cyber Security',
              'https://www.passwordrevelator.net/blog/wp-content/uploads/2021/02/conseils-cyber-securite.jpg',
              'enrolled'
            );
          }
        ),
      ),
    );
  }
}