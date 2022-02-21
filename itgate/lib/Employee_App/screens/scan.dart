import 'package:itgate/Employee_App/api/api.dart';
import 'package:itgate/Employee_App/api/scanmodel.dart';
import 'package:itgate/Employee_App/screens/showresultscan.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:itgate/Employee_App/location/locationservice.dart';
import 'package:itgate/Employee_App/location/user.dart';
import 'package:itgate/Employee_App/widget/buttonwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'package:provider/provider.dart';
class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  String? barcode;
  String? barcode2;
  String? date12;
  String? time1;
  double? dis;

//double pLat = 30.065164;   double pLng = 31.329202;

  double pLat = 30.0644721;
  double pLng = 31.3287994;

  //String id4;
  checkDate() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    setState(() {
      //id4=_user.getString('id');
    });
  }

  @override
  void initState() {
    super.initState();
    checkDate();
    WidgetsBinding.instance!.addPostFrameCallback((_) => _showStartDialog());
  }

  Future<void> _showStartDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Attend for you'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Image.asset(
                  'assets/EmployeeApp/logo.png',
                  height: MediaQuery.of(context).size.height / 4,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            DialogButton(
              child: Text(
                "DAY IN",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                scanBarcode('in');
              },
              color: Colors.amber[900],
            ),
            DialogButton(
              child: Text(
                "DAY OUT",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                scanBarcode('out');
              },
              gradient: LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0),
              ]),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String time = DateFormat('h:mma').format(now);
    time1 = time;
    String date = DateFormat('EEE_dd_MMM').format(now);
    date12 = date;
    var userLocation = Provider.of<UserLocation>(context);
    getDistanceone() async {
      final double distance = Geolocator.distanceBetween(
          pLat, pLng, userLocation.latitude!, userLocation.longitude!);
      setState(() {
        dis = distance;
      });
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(distance.toString())));
      print('--------------------------------$distance');
    }

    // //      getaddress()async{
    // //      if(userLocation!=null){
    // //      List<Placemark> placemarks =await Geolocator().placemarkFromCoordinates(userLocation.latitude, userLocation.longitude);
    // // setState(() {
    // //  barcode2=placemarks[0].name+placemarks[0].thoroughfare;
    // //   getDistanceone();
    // //   });
    // //    }}
    // //          getaddress();
    if (userLocation != null) {
      getDistanceone();
    }
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.indigo[700],
        title: Text(dis.toString()),
      ),
      body: Center(
        child: Api.data1 == null
            ? Image.asset(
                'assets/EmployeeApp/wait.gif',
                width: 200,
              )
            : Api.data1.toString() == 'OK'
                ? Image.asset(
                    'assets/EmployeeApp/wel.gif',
                    width: 200,
                  )
                : Text('ERROR'),
      ),
    );
  }

  Future<void> scanBarcode(String go) async {
    try {
      final barcode5 = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      if (!mounted) return;

      setState(() {
        this.barcode = barcode5;
        showDialog(
            context: context,
            builder: (BuildContext context) => uildPopupDialog(context, go));
        //        if(barcode!=null||dis<30.0){
        //  Fluttertoast.showToast(msg: barcode5.toString());
        //    if(go=='in'){
        //       // Api.scanAttendin(Api.id,go.toString(),time1.toString(),date12.toString());
        //    }else if(go=='out'){
        //       // Api.scanAttendout(Api.id.toString(),go.toString(),time1.toString(),date12.toString());
        //    }

        //   }else{
        //     Fluttertoast.showToast(msg: 'Out ITgate');
        //   }
      });
    } on PlatformException {
      barcode = 'Failed to get platform version.';
    }
  }

  uildPopupDialog(BuildContext context, String go) {
    return AlertDialog(
        buttonPadding: EdgeInsets.all(15),
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'confirm',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Text(
              "NO",
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
          ),
          GestureDetector(
            child: Container(
              width: 50,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              dis!.toInt() < 100
                  ?
                  // Fluttertoast.showToast(msg: go);
                  go == 'in'
                      ? Api.scanAttendin(Api.id, go.toString(),
                          time1.toString(), date12.toString())
                      : Api.scanAttendout(Api.id.toString(), go.toString(),
                          time1.toString(), date12.toString())
                  : Fluttertoast.showToast(msg: 'Out ITgate');
            },
            child: Text(
              "YES",
              style: TextStyle(fontSize: 20, color: Colors.amber),
            ),
          )
        ]);
  }
}
//30.0646245,31.3299229
