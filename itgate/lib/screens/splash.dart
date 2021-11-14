import 'dart:async';
import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/models/shared.dart';
import 'package:itgate/screens/bottom_nav_bar.dart';
import 'package:itgate/screens/login.dart';
import 'package:itgate/theme/shared_color.dart';



class SplashScreen extends StatefulWidget {

  final MainModel model;

  SplashScreen(this.model);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

 String? gotid = '';

 Widget? routing;

@override
void initState() {
  checkUser();
  super.initState();
}


  @override
  Widget build(BuildContext context) {
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
  }

  void checkUser() async {

   String id = await Shared.getSavedId('id');
   setState(() {
     gotid = id;
   });
   if(id.isEmpty) {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return Login();}));
   }else{
     await checkPath(id, widget.model);
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
   }
  }

  checkPath(String id, MainModel model) async {
    await model.login(id);
    await model.getAllCourses();
    await model.getAboutData();
    await model.getStdCourses(id);
  }
}