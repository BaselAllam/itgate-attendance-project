import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/bottom_nav_bar.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/custom_button.dart';
import 'package:itgate/widgets/fields.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:itgate/widgets/snack_bar.dart';
import 'package:scoped_model/scoped_model.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController idController = TextEditingController();

GlobalKey<FormState> idKey = GlobalKey<FormState>();

bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
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
              fields(
                'Student Id',
                'EX:324324',
                TextInputType.text,
                idController,
                idKey,
                () => 
                _updateLoginButton(),
                ),
              ScopedModelDescendant(
                builder: (context, child, MainModel model) {
                  if(model.isUserLogin == true) {
                    return Center(child: Loading());
                  }else{
                    return CustomButton(
                      'Login',
                      isEnabled,
                      () async {
                        if(idController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                        }else if(isEnabled == false) {
                          ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                        }else{
                          bool _isLoginValid = await model.login(idController.text.trim());
                          if(_isLoginValid == true) {
                            bool _getDataValid = await model.getAboutData();
                            bool _getCourseValid = await model.getAllCourses();
                            bool _isGetStdCoursesValid = await model.getStdCourses(idController.text.trim());
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(snack('Invalid Login', Colors.red));
                          }
                        }
                      }
                    );
                  }
                }
              ),
            ],
          ),
      ),
    );
  }
   _updateLoginButton() {
    setState(() {
      isEnabled = idController.text.isNotEmpty;
    });
  }
}