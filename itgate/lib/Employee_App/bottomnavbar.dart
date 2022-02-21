import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/screens/alten.dart';
import 'package:itgate/Employee_App/screens/chat.dart';
import 'package:itgate/Employee_App/screens/holiday.dart';
import 'package:itgate/Employee_App/screens/home.dart';
import 'package:itgate/Employee_App/screens/scan.dart';
//import 'package:itgate/Employee_App/screens/showattrend.dart';
import 'package:itgate/Employee_App/screens/showresultscan.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class BottomNavBar extends StatefulWidget {
  const BottomNavBar({ Key? key }) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
//int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
 List<Widget>? screens;
  
  @override
  void initState() {
   super.initState();
     screens=<Widget>[
    const Scan(), AlTen(),Chat(),const Home(),ShowResltAttend()
  ];
   
  }
  int current=2;
  @override
  Widget build(BuildContext context) {
    
    Api.checkDate();
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: current,
          height: 60.0,
          items: <Widget>[
            Image.asset('assets/EmployeeApp/Scan.png', height:30),
             Image.asset('assets/EmployeeApp/attend.png', height:30),
              Image.asset('assets/EmployeeApp/home.png', height:30),
            Image.asset('assets/EmployeeApp/break.png', height:30),
            Image.asset('assets/EmployeeApp/Holiday.png', height:30)
           // Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.indigo[700]!,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.amber[700]!,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              current = index;
            });
          },
          letIndexChange: (index) => true,
        ),
       
         body: screens![current], 
        );
  }
}