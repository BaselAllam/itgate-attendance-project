import 'package:flutter/material.dart';
import 'package:itgate/models/main_model.dart';
import 'package:itgate/screens/scan_qr.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/loading.dart';
import 'package:itgate/widgets/snack_bar.dart';
import 'package:scoped_model/scoped_model.dart';




class TakeAttendance extends StatefulWidget {
  const TakeAttendance({ Key? key }) : super(key: key);

  @override
  _TakeAttendanceState createState() => _TakeAttendanceState();
}

class _TakeAttendanceState extends State<TakeAttendance> {

bool _isSecondEnabled = false;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (context, child, MainModel model) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
                'Take Attendance',
                style: primaryBlackFontStyle,
              ),
              iconTheme: IconThemeData(color: secondaryColor, size: 20.0),
            backgroundColor: Colors.white,
          ),
          body: Container(
            margin: EdgeInsets.all(10.0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  title: Text(
                    'First Step',
                    style: subTextStyle
                  ),
                  subtitle: Text(
                    'Press to Verify Your Location',
                    style: primaryBlackFontStyle
                  ),
                  trailing: Container(
                    height: 45.0,
                    width: 45.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      shape: BoxShape.circle
                    ),
                    alignment: Alignment.center,
                    child: model.isGetCurrentPositionLoading ? Loading() :  Icon(Icons.location_on, color: Colors.white, size: 25.0),
                  ),
                  onTap: () async {
                    if(model.isGetCurrentPositionLoading == false) {
                      int _validator = await model.getCurrentPosition();
                      if(_validator == 1) {
                        ScaffoldMessenger.of(context).showSnackBar(snack('No Permission Allowed for this app got to setting and give us a permission', Colors.red));
                      }else if(_validator == 2) {
                        ScaffoldMessenger.of(context).showSnackBar(snack('Please Enable Location Service Button', Colors.red));
                      }else if(_validator == 3) {
                        ScaffoldMessenger.of(context).showSnackBar(snack('Some thing went wrong', Colors.red));
                      }else if(_validator == 4) {
                        ScaffoldMessenger.of(context).showSnackBar(snack('Incorrect Location', Colors.red));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(snack('Location Validated Successfully', Colors.green));
                        setState(() {
                          _isSecondEnabled = !_isSecondEnabled;
                        });
                      }
                    }
                  },
                ),
                SizedBox(height: 30.0),
                ListTile(
                  title: Text(
                    'Second Step',
                    style: subTextStyle
                  ),
                  subtitle: Text(
                    'Press to Scan Qr Code',
                    style: _isSecondEnabled == false ? subTextStyle : primaryBlackFontStyle
                  ),
                  trailing: Container(
                    height: 45.0,
                    width: 45.0,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: _isSecondEnabled ? secondaryColor : Colors.grey,
                      shape: BoxShape.circle
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.qr_code_2, color: Colors.white, size: 30.0
                    ),
                  ),
                  onTap: () {
                    if(_isSecondEnabled == false) {
                      ScaffoldMessenger.of(context).showSnackBar(snack('Verify Location First', Colors.red));
                    }else{
                      Navigator.push(context, MaterialPageRoute(builder: (_) {return ScanQr();}));
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}