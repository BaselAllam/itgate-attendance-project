import 'package:flutter/material.dart';
import 'package:itgate/screens/bottom_nav_bar.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/custom_button.dart';
import 'package:itgate/widgets/fields.dart';
import 'package:itgate/widgets/snack_bar.dart';


class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

TextEditingController idController = TextEditingController();
TextEditingController passwordController = TextEditingController();

GlobalKey<FormState> idKey = GlobalKey<FormState>();
GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

bool isSecure = true;

bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  '\nIt Gate Academy',
                  style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold, fontSize: 35.0) ,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Take your attendance easily\nand Check out new courses\n',
                  style: primaryBlackFontStyle
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height/4,
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/loginimage.jpg'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              fields(
                'Student Id',
                'EX:324324',
                TextInputType.text,
                idController,
                idKey,
                () => 
                _updateLoginButton(),
                ),
              fields(
                'Student Password',
                '****',
                TextInputType.text,
                passwordController,
                passwordKey,
                () =>
                _updateLoginButton(),
                secure: isSecure,
                suffix: IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: secondaryColor,
                  iconSize: 20.0,
                  onPressed: () {
                    setState(() {
                      isSecure = !isSecure;
                    });
                  },
                ),
              ),
              CustomButton(
                'Login',
                isEnabled,
                () {
                  if(!_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                  }else if(isEnabled == false) {
                    ScaffoldMessenger.of(context).showSnackBar(snack('Some Fields Required', Colors.red));
                  }else{
                    // Shared.saveOffline('email', emailController.text);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {return BottomNavBar();}));
                  }
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
   _updateLoginButton() {
    setState(() {
      isEnabled = idController.text.isNotEmpty &&
          passwordController.text.isNotEmpty;
    });
  }
}