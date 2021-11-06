import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';



class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Profile',
            style: primaryBlackFontStyle,
          ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            profileData()
          ],
        ),
      ),
    );
  }
  profileData() {
    return Card(
      elevation: 3.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: [
          profileItem(Icons.person, 'Bassel Allam'),
          profileItem(Icons.info, 'Id: 234432d'),
          profileItem(Icons.info, 'National Number: 2303024435345'),
          profileItem(Icons.info, 'Email: baseljahen@gmail.com'),
          profileItem(Icons.info, 'Mobile Number: 010101010'),
          profileItem(Icons.content_paste, 'Course Name'),
        ],
      ),
    );
  }
  profileItem(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(icon, color: secondaryColor, size: 25.0),
        title: Text(
          '$title',
          style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}