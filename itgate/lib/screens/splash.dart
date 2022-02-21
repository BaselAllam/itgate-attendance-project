import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/models/shared.dart';
import 'package:itgate/screens/bottom_nav_bar.dart';
import 'package:itgate/screens/on_borad.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:scoped_model/scoped_model.dart';



class SplashScreen extends StatefulWidget {

  final MainModel model;

  SplashScreen(this.model);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 @override
 void initState() {
   checkUser();
   super.initState();
 }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (context, child, model) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/logo.png', height: MediaQuery.of(context).size.height/2.5),
                CircularProgressIndicator(
                  backgroundColor: primaryColor,
                  color: secondaryColor,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void checkUser() async {

   String id = await Shared.getSavedId('id');

   if (id.isEmpty) {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return OnBoard();}));
   } else {
     String instructorOrStudent = await Shared.getSavedId('instructor');
     if (instructorOrStudent == 'true') {
      bool _valid = await ScopedModel.of<MainModel>(context).instructorLogin(id);
       if (_valid == true) {
         await ScopedModel.of<MainModel>(context).getInstructorCourses(id);
         await ScopedModel.of<MainModel>(context).getAboutData();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return InstructorBottomNavBar();}));
      }
     } else {
      bool _valid = await ScopedModel.of<MainModel>(context).studentLogin(id);
      if (_valid == true) {
        await ScopedModel.of<MainModel>(context).getAllCourses();
        await ScopedModel.of<MainModel>(context).getAboutData();
        await ScopedModel.of<MainModel>(context).getStdCourses(id);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
      }
     }
   }
  }
}