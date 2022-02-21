import 'package:itgate/Employee_App/screens/scan.dart';
import 'package:itgate/Employee_App/screens/social.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
class Chat extends StatefulWidget {
  const Chat({ Key? key }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
 Widget build(BuildContext context) {
return Scaffold(
  body: Stack(
    fit: StackFit.expand,
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage("assets/EmployeeApp/icon.jpg"),
                fit: BoxFit.cover
            )
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(top: 200.0),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
          children: [
      InkWell(
        onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SecondPage('https://www.itgateacademy.com/index.php')));
//       print("tapped");
        },
        child:  Container(
          height: 55,
          width: 55,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/EmployeeApp/web.png'),))
            ),
      ),
      Container(width: 15,),
        InkWell(
            onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SecondPage('https://www.facebook.com/ITGateAcademy')));
//       print("tapped");
        },
        child:  Container(
          height: 65,
          width: 65,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/EmployeeApp/facebook.png'),))
            ),
      )
      ],
      )
      ),

    ],
  ),
);
}
//child:
// Image.asset(
//              'assets/icon.jpg',
//               width:  MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height
//             ),
// Container(
//   child: new InkWell(
//     onTap: () {
//       Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SecondPage('https://stackoverflow.com/questions/53861302/passing-data-between-screens-in-flutter')));
//       print("tapped");
//     },
//     child: 
//     SingleChildScrollView(
//             child: Container(
//       decoration: const BoxDecoration(
//         image: DecorationImage(
//             image: AssetImage('assets/bgmain.jpg'),
//             //fit: BoxFit.cover 
//             fit: BoxFit.fill),
//       ),))
//     Container(
       
//           decoration: ShapeDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/icon.jpg'),
//                   fit: BoxFit.fitWidth),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadiusDirectional.circular(20))),
//           width: MediaQuery.of(context).size.width,
//           height:MediaQuery.of(context).size.height,
//           child: Align(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 "Container decoration implements rounded corners (radius = 20)",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//             alignment: Alignment.bottomCenter,
//           ),
          
//         ),
//   ),
// ),
        // Column(
        //   children: [
        //    // Padding(padding:  const EdgeInsets.all(16.0),),
        //     Card(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadiusDirectional.circular(20)),
        //     clipBehavior: Clip.antiAlias,
        //     child: Image.asset(
        //      'assets/icon.jpg',
        //       width:  MediaQuery.of(context).size.width/1.5,
        //       height: MediaQuery.of(context).size.height/1.5
        //     ),
        //   )
        //   // Card(
            
        //   //   child: Image.asset('assets/web.png',height: MediaQuery.of(context).size.height/4),
        //   // ),
        //   // Card()
        //          ],       ),
   
}