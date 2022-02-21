import 'package:flutter/material.dart';
import 'package:itgate/models/courses/courses_model.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';



class CourseItem extends StatefulWidget {

final CourseModel courseModel;

CourseItem(this.courseModel);


  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {

  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Card(
        elevation: 5.0,
        margin: EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          width: MediaQuery.of(context).size.width/1.2,
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
                  image: DecorationImage(
                    image: NetworkImage('https://www.itgateacademy.com/TGA/admin/layout/images/courses/${widget.courseModel.courseImg}'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              ListTile(
                title: Text(
                  '${widget.courseModel.courseName}',
                  style: primaryBlackFontStyle,
                ),
              ),
              ListTile(
                title: Text(
                  '${widget.courseModel.coursePrice} EGP | ${widget.courseModel.courseHours} Hours | ${widget.courseModel.online}',
                  style: secondaryTextStyle
                ),
                trailing: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Material(
                          color: Colors.transparent,
                          child: Container(
                            margin: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white,
                            ),
                            padding: EdgeInsets.all(10.0),
                            child: ListView(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: Icon(Icons.close),
                                    color: secondaryColor,
                                    iconSize: 20.0,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                                Container(
                                  height: 150.0,
                                  margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage('https://www.itgateacademy.com/TGA/admin/layout/images/courses/${widget.courseModel.courseImg}'),
                                      fit: BoxFit.fill
                                    ),
                                    borderRadius: BorderRadius.circular(20.0)
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    '${widget.courseModel.courseName}',
                                    style: primaryBlackFontStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    'Description:\n${widget.courseModel.courseDescription}',
                                    style: subTextStyle,
                                  ),
                                ),
                              ]
                            ),
                          ),
                        );
                      }
                    );
                  },
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(15.9),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'More',
                        style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}