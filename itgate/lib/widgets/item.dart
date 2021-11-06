import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_font_style.dart';



class CourseItem extends StatefulWidget {

final String name;
final String image;
final String type;

CourseItem(this.name, this.image, this.type);


  @override
  _CourseItemState createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {

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
                    image: NetworkImage(widget.image),
                    fit: BoxFit.fill
                  )
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                title: Text(
                  'Mastering Cyber Security',
                  style: primaryBlackFontStyle,
                ),
              ),
              ListTile(
                title: Text(
                  '2000 EGP | 520 Hours',
                  style: secondaryTextStyle
                ),
                trailing: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[600],
                    borderRadius: BorderRadius.circular(15.9),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Security',
                      style: TextStyle(color: Colors.white, fontSize: 10.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}