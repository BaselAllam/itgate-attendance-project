import 'package:flutter/material.dart';
import 'package:itgate/screens/home_page.dart';
import 'package:itgate/screens/our_courses.dart';
import 'package:itgate/screens/profile.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';




class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

final List<Widget> screens = [
  HomePage(), OurCourses(), Profile(),
];

int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          bottomItem(Icons.home, 'Home'),
          bottomItem(Icons.category, 'Courses'),
          bottomItem(Icons.person, 'Profile'),
        ],
        backgroundColor: Colors.white,
        elevation: 0.0,
        selectedLabelStyle: primaryFontStyle,
        unselectedLabelStyle: secondaryTextStyle,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 18.0),
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 18.0),
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
  BottomNavigationBarItem bottomItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label
    );
  }
}