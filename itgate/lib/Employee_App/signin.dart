
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/bottomnavbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
class SignIn extends StatefulWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController idcontroller=TextEditingController();
  GlobalKey<FormState> idkey=GlobalKey<FormState>();
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.all(10.0),
        alignment: Alignment.center,
        child: Form(
         key: _formKey,
         child:ListView (
           scrollDirection: Axis.vertical,
          children: [
            Image.asset('assets/logo.png',height:MediaQuery.of(context).size.height/1.5 ,),
            input(Icons.person, 'ID', idcontroller, idkey),
            Builder(builder: (BuildContext context){
              return Container(
                 margin: EdgeInsets.only(right:20.0,left: 20.0),
                child:
              FlatButton(
             
        onPressed: ()async{
                    if(!_formKey.currentState!.validate()){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('complet info'),));
                    }else{
                      Api.persign(idcontroller.text);
                      
                      if(Api.signinval=='OK'){
                          SharedPreferences _user=await SharedPreferences.getInstance();
                             _user.setString('id', idcontroller.text);
                             _user.setBool('emp', true);
                              Fluttertoast.showToast(
        msg: "WELCOME TO YOU",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
        fontSize: 16.0
    );
                      Navigator.pushReplacement(context, 
                      MaterialPageRoute(builder:(_){
                       return BottomNavBar();
                      })
                      );
                      }else if(Api.signinval==null){
                        CircularProgressIndicator();
                      }
                      else{
                        Fluttertoast.showToast(
        msg: "WRONG ID",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
                      }
                     
                    }
                          }, 
                          
        child: Text('SIGN IN',style:TextStyle(
        color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold
                                                                       ),
                                                                       ),
         color:Colors.indigo[900] ,
          shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0), ),  
             padding: EdgeInsets.only(left: 50.0,right: 50.0),                                                       
                                                                       ));
            })

          ],
          ),
        ),
      ),
      
    );
  }
}
input(IconData icon,String label,TextEditingController controller,Key key){
  return Container(
    margin: EdgeInsets.all(10.0),
    child:TextFormField(
      key: key,
      validator: (value){
        if(value!.isEmpty){
          return 'this field required';
        }
      },
   decoration: InputDecoration(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black,width:1.5)
                                ),
      enabledBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black,width: 1.5)
                                ),
      disabledBorder:    OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.black,width: 1.5)
                                ), 
       errorBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.red,width: 1.5)
                                ), 
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.teal,width: 2.0)
                                ), 
         labelText: label,
             labelStyle: TextStyle(color: Colors.black)),                                                                                             
      
      controller: controller,
    ) ,
  );
}