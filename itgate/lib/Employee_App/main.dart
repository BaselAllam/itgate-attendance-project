import 'dart:async';  
import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/bottomnavbar.dart';
import 'package:itgate/Employee_App/location/locationservice.dart';
import 'package:itgate/Employee_App/location/user.dart';
import 'package:itgate/Employee_App/signin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';  

  
class Employee extends StatelessWidget {  
  @override  
  Widget build(BuildContext context) {
   return StreamProvider<UserLocation>(
     initialData: UserLocation(),
    create: (context) => LocationService().locationStream,
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
          //  backgroundColor: Colors.amber,
            body: MyHomePage(),
          )),
    );
  }
}  
  
class MyHomePage extends StatefulWidget {  
  @override  
  SplashScreenState createState() => SplashScreenState();  
}  
class SplashScreenState extends State<MyHomePage> { 

  // String id;
  // checkDate() async{
  //   SharedPreferences _user=await SharedPreferences.getInstance();
  //   setState(() {
  //     id=_user.getString('id');
  //   });
  // }
  @override  
  void initState() {  
    super.initState();
   // checkDate();  
    Timer(Duration(seconds: 5),  
            ()=>Navigator.pushReplacement(context,  
            MaterialPageRoute(builder:  
                (context) {
                  return Api.id==null?SignIn():BottomNavBar();
                } 
            )  
         )  
    );  
  }  
  @override  
  Widget build(BuildContext context) {  
    Api.checkDate();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset('assets/logo.png', height: MediaQuery.of(context).size.height/2.5,),
            CircularProgressIndicator(
              backgroundColor:Colors.blue.shade900,
              color: Colors.orange,
            )
          ],
        ),
      ),
    );
  }  
 
}  