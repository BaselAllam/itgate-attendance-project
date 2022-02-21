import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/api/scanmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String brak='0:00AM';
   String brak1='0:00AM';
   String? date;
   // String id;
    int? breaktime;
     int? differenceInHours;
   Future<List<ScanModel>>? albums;

   
 

  bool isButtonActive=true;
  @override
  Widget build(BuildContext context) {
     checkDate() async{
    SharedPreferences _user=await SharedPreferences.getInstance();
    try {
    setState(() {
      brak=_user.getString('break')!;
      // id=_user.getString('id');

    }); 
    } catch (e) {
      setState(() {
        brak= '';
      });
    }
    
  }
  checkDate();
      DateTime now = DateTime.now();
String formattedDate = DateFormat('h:mma ').format(now);
  date=DateFormat('EEE_dd_MMM').format(now);
 if(int.parse(Api.breaktime.toString())>60){
    isButtonActive=false;
 }
 var fin= 60-int.parse(Api.breaktime.toString());
    Api.getdatabr(Api.id,date.toString());
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
          backgroundColor: Colors.indigo[700],
        ),
      body: 
                   Column(
     // padding: EdgeInsets.all(24),
      children: [
         Container(height: 100,),
  //       Text(Api.breaktime.toString()+'\n'+fin.toString() ,style: TextStyle(
  // 	fontWeight: FontWeight.bold
  //   ,fontSize: 20.0
  // ), ),
ElevatedButton(onPressed:isButtonActive?() async{
   SharedPreferences _user=await SharedPreferences.getInstance();
                             _user.setString('break', formattedDate);
 
}:null,

 child: Text('START BREAK'), 
  style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
    
    
    ),
    Container(height: 40,),


ElevatedButton(onPressed:isButtonActive?() {
  brak1=formattedDate;
   var dateFormat = DateFormat('h:ma');
     DateTime durationStart = dateFormat.parse(brak.toString());
  DateTime durationEnd = dateFormat.parse(brak1.toString());
  differenceInHours = durationEnd.difference(durationStart).inMinutes;
  
  breaktime=int.parse(Api.breaktime.toString())+differenceInHours!;
 Api.timeone(Api.id, date.toString(), breaktime.toString());
}:null, child: Text('End BREAK'), 
 style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[900],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 15.0,
                      ),
    ),
    Container(
      height:40 ,
    ),
    Center(child: 
    Row(
    
      children: [
        Container(width: 85,),
        Column(children: [
           Text(Api.breaktime.toString(),style: TextStyle(
  	fontWeight: FontWeight.bold
    ,fontSize: 20.0
  ), ),
          Text('Passed',style: TextStyle(color: Colors.orange))],),
         Container(width: 90,),
        Column(children: [
           Text(fin.toString() ,style: TextStyle(
  	fontWeight: FontWeight.bold
    ,fontSize: 20.0
  ), ),
          Text('Remainder',style: TextStyle(color: Colors.orange))],)
     
    ],),)
    // Container(
    //   child:  CountdownFormatted(
    //             duration: Duration(minutes: int.parse('5')),
    //             builder: (BuildContext ctx, String remaining) {
    //               return Text(
    //                 remaining,
    //                 style: TextStyle(fontSize: 30),
    //               ); // 01:00:00
    //             },
    //           ),
    // )
   

                ],
      ),
             

       );
  }
}