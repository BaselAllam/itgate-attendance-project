import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/screens/holiday.dart';
import 'package:itgate/Employee_App/screens/sendmsg.dart';
import 'package:flutter/material.dart';
class ShowResltAttend extends StatefulWidget {
  const ShowResltAttend({ Key? key }) : super(key: key);

  @override
  _ShowResltAttendState createState() => _ShowResltAttendState();
}

class _ShowResltAttendState extends State<ShowResltAttend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
           backgroundColor: Colors.indigo[700],
        ),
       body:
       Center(
        child: Column(
          children: [
            Container(height: 50,),
             InkWell(
        onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SendMsg()));
//       print("tapped");
        },
        child:  Container(
          height: 150,
          width: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/EmployeeApp/finallllly.png',),)
            
            )
            ),
            
      ),Container(width: 150, child: 
     Row(children: [ 
       Container(width: 35,),
       Text('Holiday Request',style: TextStyle(color: Colors.orange))],),
      
      ),
       Container(height: 70,),
             InkWell(
        onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Holiday()));
//       print("tapped");
        },
        child:  Container(
          height: 150,
          width: 150,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/EmployeeApp/holiday list.png',),)
            
            )
            ),
            
      ),Container(width: 150, child: 
     Row(children: [ 
       Container(width: 35,),
       Text('All Vacations',style: TextStyle(color: Colors.orange))],),
      
      )
          ],
        ),
       )
      
    );
  }
}