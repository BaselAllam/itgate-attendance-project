import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/models/shared.dart';
import 'package:itgate/screens/bottom_nav_bar.dart';
import 'package:itgate/screens/login.dart';
import 'package:scoped_model/scoped_model.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

String? gotid;

@override
void initState() {
  checkUser();
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: checkPath(gotid!, model)
          );
        },
      ),
    );
  }

  checkUser() async {

   String id = await Shared.getSavedId('id');
   setState(() {
     gotid = id;
   });
  }

  checkPath(String id, MainModel model) {
    if(id.isNotEmpty){
      model.login(id);
      model.getAllCourses();
      model.getAboutData();
      return BottomNavBar();
    }else{
      return Login();
    }
  }
}