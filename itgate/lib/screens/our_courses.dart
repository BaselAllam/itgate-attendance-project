import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/course_item.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:scoped_model/scoped_model.dart';



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
            'Our Coures',
            style: primaryBlackFontStyle,
          ),
        backgroundColor: Colors.white,
      ),
      body: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return Container(
            margin: EdgeInsets.all(10.0),
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                if(model.isGetCoursesLoading == true) {
                  return Center(child: Loading());
                }else if(model.allCourses.isEmpty) {
                  return Center(child: Text('Some Thing Went Wrong', style: TextStyle(color: blackColor, fontSize: 40.0, fontWeight: FontWeight.bold)));
                }else{
                  return CourseItem(
                    model.allCourses[index],
                    '!enrolled'
                  );
                }
              }
            ),
          );
        },
      ),
    );
  }
}