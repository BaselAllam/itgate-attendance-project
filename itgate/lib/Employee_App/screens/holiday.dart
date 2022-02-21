import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/api/attendmodel.dart';
import 'package:itgate/Employee_App/api/holidaymodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Holiday extends StatefulWidget {
  const Holiday({ Key? key }) : super(key: key);

  @override
  _HolidayState createState() => _HolidayState();
}

class _HolidayState extends State<Holiday> {
  
  bool aprove=false;
   Future<List<HoliModel>>? albums;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
     
    });
  }
  @override
  Widget build(BuildContext context) {
      
  
   albums=Api.getdataholi(Api.id);
   
    return Scaffold(
      backgroundColor: Colors.grey[350],
       appBar: AppBar(
          backgroundColor: Colors.indigo[700],
        ),
        body: Column(
        children: <Widget>[
  //        Row(
           
  //                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         children:<Widget>[
  //           Container(
  //             width: 300,
  //             padding: EdgeInsets.all(5.0),
  //             decoration:BoxDecoration(
  //               borderRadius:BorderRadius.circular(10),
  //               color:Colors.grey
                
  //             ),
  //             child: Center(
  //               child:Column( children: [
  //               TextField(
  //                 controller: textcontroll,
  //           decoration: InputDecoration(
  //             filled: true,
  //             fillColor: Colors.white,
  //             border: OutlineInputBorder(
  //               borderSide: BorderSide.none,
  //               borderRadius: BorderRadius.circular(10)
  //             ),
  //           ),
  //         ),ElevatedButton(onPressed: (){
  //          if( textcontroll.text.isEmpty){
  //            Fluttertoast.showToast(msg: 'write your message+${Api.id}', backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0);
  //          }else{
  //            Api.sendmessage(Api.id, textcontroll.text,date);
  //            textcontroll.clear();
  //          Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                         builder: (context) =>
  //                             Holiday()),
  //                   ).then((value) => setState(() {}));
  //                   print("refresh done ");
                  
             
  //          }
  //         }, child: Text('send '), style: ElevatedButton.styleFrom(
  //   primary: Colors.orange, // background
  //   onPrimary: Colors.white, // foreground
  // ),)
  //         ],)
  //                   )
  //                    ),
           
           
  //         ]
  //       ), 
        // Card(
                 
        //           child:
        //   ListTile(
                   
        //             title: Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   children:<Widget>[
        //     Container(
        //       width: 100,
        //       padding: EdgeInsets.all(5.0),
        //       decoration:BoxDecoration(
        //         borderRadius:BorderRadius.circular(20),
        //         color:Colors.grey[700]
                
        //       ),
        //       child: Center(
        //         child: 
        //       Text('Mon_2_jan',style: TextStyle(color:Colors.white,fontSize:15,),textAlign: TextAlign.center, ),)
        //     ),
        //     Container(
        //        width: 75,
        //        height: 75,
        //     //  padding: EdgeInsets.all(5.0),
        //       decoration:BoxDecoration(
        //         borderRadius:BorderRadius.circular(10),
        //       // color:Colors.grey[700]
                
        //       ),
        //       child: Center(
        //         child: 
        //        // Icon(Icons.)
        //        aprove==true?Image.asset('assets/right.png',):Image.asset('assets/false.png',height: 75,)
        //       //Text('Aprove',style: TextStyle(color:Colors.white,fontSize:15,),textAlign: TextAlign.center, ),
        //       )
        //     ),
        //   ]
        //   ),
        //              subtitle: Row(
        //                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                children: [
        //                   Container(
        //        width: 300,
        //       padding: EdgeInsets.all(5.0),
        //       decoration:BoxDecoration(
        //         borderRadius:BorderRadius.circular(20),
        //        color:Colors.grey[700]
                
        //       ),
        //       child: Center(
        //         child: 
        //       Text('When I create an app with a flutter create command,\n the flutter logo is used as an application icon for both platforms.',
        //       style: TextStyle(color:Colors.white,fontSize:15,),textAlign: TextAlign.center, ),)
        //     ),
        //                ],
        //              ),
        //           ),),
          Expanded(
            child: 
              FutureBuilder<List<HoliModel>>(
        future:albums,
        builder: (context,snapshot) {
         
          if(snapshot.hasData){
            return ListView.builder(
              // reverse: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, i) {
                 int reverse=snapshot.data!.length-1-i;
                    return Dismissible(
                      background: Container(
                        color:Colors.grey,
                        child: Icon(Icons.check),
                      ),
                      secondaryBackground:Container(
                        color: Colors.red,
                        child: Icon(Icons.cancel),
                      ) ,
                      key: ObjectKey(snapshot.data![i].id),
                      onDismissed: (direction) {
                        //print(direction.index);
                      
                      },
                child: Card(
                 
                  child:
                  ListTile(
                   
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:<Widget>[
            Container(
              width: 100,
              padding: EdgeInsets.all(5.0),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
                color:Colors.grey
                
              ),
              child: Center(
                child: 
              Text(snapshot.data![reverse].date.toString(),style: TextStyle(color:Colors.white,fontSize:15,),textAlign: TextAlign.center, ),)
            ),
            Container(
               width: 80,
              padding: EdgeInsets.all(5.0),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
              // color:Colors.grey[700]
                
              ),
              child: Center(
                child: 
              snapshot.data![reverse].state.toString()=='dissapprove'?InkWell(
                child:Image.asset('assets/false.png',height: 75,),
                    onTap: () => showDialog(
                      
                      context: context,
                      builder: (ctxDialog) => Scaffold(
                        
                        backgroundColor: Colors.transparent,
                        body: Stack(
                          
                          children: <Widget>[
                             Container(
        width: MediaQuery.of(context).size.width,
        child:
                            AlertDialog(
                              
                             shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))
          
      ),
                              backgroundColor: Colors.blueGrey[900],
                              titlePadding: EdgeInsets.zero,
                              title: Padding(
                                padding: EdgeInsets.only(left: 20.0,right: 20.0),
                                child:Container(
                                decoration: BoxDecoration(
                                  
                                  border: Border(

                                    bottom: BorderSide(
                                      
                                      color: Colors.white,
                                      width: 0,
                                      
                                    ),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Column(
                                    children: <Widget>[
                                      
                                      FittedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Not Accepting',
                                            style: TextStyle(
                                              
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22,
                                              color: Colors.white
                                            ),
                                          ),
                                        ),
                                      ),
                                     // Text('Lantai 1'),
                                    ],
                                  ),
                                ),
                               ) ),
                              content: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 0, ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      snapshot.data![reverse].replay==''?
                                      Text(  'NOT SEEN YET',style: TextStyle(
                                              
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white
                                            ),): Text(  snapshot.data![reverse].replay!,style: TextStyle(
                                              
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.white
                                            ),),
                                            Container(
                                              height:10.0
                                            ),
                                    Container(
                                     padding:EdgeInsets.only(left: 60.0,right: 60.0) ,
                                    width: MediaQuery.of(context).size.width ,
                                      decoration: BoxDecoration(
                                color: Colors.white,  
                                 borderRadius: BorderRadius.all(Radius.circular(5)),      
                  border: Border.all(
                  color: Colors.white,
                  width: 2,
              )),
                                      child: InkWell(
                                        
                                        // padding:EdgeInsets.only(left: 30.0,right: 30.0) ,
                                        child: Center(child: Text('Leave',style: TextStyle( color: Colors.black),),),
                                        onTap: () { Navigator.pop(context);},
                                      ),
                                    ),
                                     
                                    ],
                                  ),
                                ),
                              ),
                            ),
                             )
                          ],
                        ),
                      ),
                    ),
                  
                  ):Image.asset('assets/right.png',height: 75,)
            
            ),)
          ]
          ),
                     subtitle: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                          Container(
               width: 300,
              padding: EdgeInsets.all(5.0),
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20),
               color:Colors.grey
                
              ),
              child: Center(
                child: 
              Text("For::"+snapshot.data![reverse].hist.toString()+'\n'+snapshot.data![reverse].mes.toString(),style: TextStyle(color:Colors.white,fontSize:15,),textAlign: TextAlign.center, ),)
            ),
                       ],
                     ),
                  ),
                     ) 
                     );
                    
              }
              );
          }else if(snapshot.hasError){
            Text('Sorry there');
          }
          return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           // Image.asset('assets/logo.png', height: MediaQuery.of(context).size.height/2.5,),
           Center( child:
            CircularProgressIndicator(
              backgroundColor:Colors.blue.shade900,
              color: Colors.orange,
            ))
          ],
        );      
        },
        
        ),
    
          ),
        ],
      ),
      
         
    );
  }
}