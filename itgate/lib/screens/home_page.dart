import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/item.dart';



class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Welcome Bassel',
            style: primaryBlackFontStyle,
          ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            item('Running Courses', Icons.play_lesson_outlined),
            CourseItem(
                'Cyber Security',
                'https://www.passwordrevelator.net/blog/wp-content/uploads/2021/02/conseils-cyber-securite.jpg',
                'enrolled'
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Divider(color: Colors.grey, thickness: 2.0),
              ),
              item('Ended Courses', Icons.done),
            CourseItem(
              'Cyber Security',
              'https://www.passwordrevelator.net/blog/wp-content/uploads/2021/02/conseils-cyber-securite.jpg',
              'ended'
            ),
          ],
        ),
      ),
    );
  }
  item(String title, IconData icon) {
    return ListTile(
      title: Text(
        title,
        style: primaryFontStyle,
      ),
      trailing: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(15.9),
        ),
        child: Icon(icon, color: Colors.white, size: 25.0),
      ),
    );
  }
}