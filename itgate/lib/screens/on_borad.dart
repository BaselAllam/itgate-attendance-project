import 'package:flutter/material.dart';
import 'package:itgate/Employee_App/main.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/login.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/custom_button.dart';
import 'package:scoped_model/scoped_model.dart';




class OnBoard extends StatefulWidget {

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ScopedModelDescendant(
          builder: (context, child, MainModel model) {
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    '\nIt Gate Academy',
                    style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 35.0) ,
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Take your attendance easily\nand Check our new courses\n',
                    style: primaryBlackFontStyle
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/4,
                  width: MediaQuery.of(context).size.width/2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/loginimage.jpg'),
                      fit: BoxFit.fill
                    )
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      'Login As...',
                      style: TextStyle(color: secondaryColor, fontWeight: FontWeight.bold, fontSize: 35.0) ,
                    ),
                  ),
                ),
                CustomButton(
                  'Instructor',
                  true,
                  () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return Login(false);}));}
                ),
                CustomButton(
                  'Student',
                  true,
                  () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return Login(true);}));
                  }
                ),
                CustomButton(
                  'Employee',
                  true,
                  () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return Employee();}));
                  }
                ),
              ]
            );
          },
        ),
      ),
    );
  }
}