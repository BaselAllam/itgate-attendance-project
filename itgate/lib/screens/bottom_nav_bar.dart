import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/about_screen.dart';
import 'package:itgate/screens/home_page.dart';
import 'package:itgate/screens/instructor_home_page.dart';
import 'package:itgate/screens/our_courses.dart';
import 'package:itgate/screens/profile.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:scoped_model/scoped_model.dart';




class BottomNavBar extends StatefulWidget {

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

List<Widget> screens = [
  HomePage(), OurCourses(), AboutScreen(), Profile(),
];

int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomItem(Icons.home, 'Home'),
          bottomItem(Icons.category, 'Courses'),
          bottomItem(Icons.info_outline, 'About Us'),
          bottomItem(Icons.person, 'Profile'),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        selectedLabelStyle: primaryFontStyle,
        unselectedLabelStyle: secondaryTextStyle,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 25.0),
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25.0),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return screens[current];
        },
      )
    );
  }
  BottomNavigationBarItem bottomItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label
    );
  }
}



class InstructorBottomNavBar extends StatefulWidget {

  @override
  _InstructorBottomNavBarState createState() => _InstructorBottomNavBarState();
}

class _InstructorBottomNavBarState extends State<InstructorBottomNavBar> {

List<Widget> screens = [
  InstructorHomePage(), AboutScreen(), Profile(),
];

int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomItem(Icons.home, 'Home'),
          bottomItem(Icons.info_outline, 'About Us'),
          bottomItem(Icons.person, 'Profile'),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        selectedLabelStyle: primaryFontStyle,
        unselectedLabelStyle: secondaryTextStyle,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 25.0),
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 25.0),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return body();
        },
      )
    );
  }
  BottomNavigationBarItem bottomItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label
    );
  }

  body() {
    if (current == 0) {
      return InstructorHomePage();
    } else if (current == 1) {
      return AboutScreen();
    } else if (current == 2) {
      return Profile();
    }
  }
}