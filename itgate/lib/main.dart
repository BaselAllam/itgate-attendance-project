import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/scan_device.dart';
import 'package:scoped_model/scoped_model.dart';



void main() => runApp(MyApp());


class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: MainModel(),
      child: ScopedModelDescendant(
        builder: (context, child, MainModel model) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: ScanDevices()
            // home: SplashScreen(model)
          );
        },
      ),
    );
  }
}