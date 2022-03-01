import 'package:flutter/material.dart';
import 'package:itgate/Employee_App/main.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/splash.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

bool isEmp = false;

@override
void initState() {
  checkEmp();
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
            home: isEmp ? Employee() : SplashScreen()
          );
        },
      ),
    );
  }

  checkEmp() async {

    try {
      SharedPreferences _check = await SharedPreferences.getInstance();
      bool? _valid = _check.getBool('emp');
      setState(() {
        isEmp = _valid!;
      });
    } catch (e) {
      setState(() {
        isEmp = false;
      });
    }
  }
}