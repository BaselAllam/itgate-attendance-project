import 'dart:convert';

import 'package:itgate/Employee_App/api/attendmodel.dart';
import 'package:itgate/Employee_App/api/holidaymodel.dart';
import 'package:itgate/Employee_App/api/scanmodel.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Api {
  static var signinval;
  static var data1;
  static var breaktime = '00';
  static var id;

   static String BASE_URL = 'https://itgateacademy.com/TGA/newsystem/';

  static checkDate() async {
    SharedPreferences _user = await SharedPreferences.getInstance();
    //  setState(() {
    // brak=_user.getString('break');
    id = _user.getString('id');

    // });
  }

 
  static Future<ScanModel?> persign(String id) async {
    Response response =
        await post(Uri.parse('$BASE_URL/check.php'), body: {
      'user_id': id,
    });
    print(response.body);
    if (response.statusCode == 200) {
      try {
        signinval = json.decode(response.body)['response'];

        print(json.decode(response.body));

        return ScanModel.fromJson(json.decode(response.body));
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
  }

/////////////////////////////
  static Future<ScanModel?> scanAttendin(
      String id, String going, String time, String date) async {
    Response response = await post(
        Uri.parse('$BASE_URL/attendd.php'),
        body: {'id': id, 'going': going, 'time': time, 'date': date});

    print(response.body);

    if (response.statusCode == 200) {
      try {
        data1 = json.decode(response.body)['response'];
        return ScanModel.fromJson(json.decode(response.body));
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
  }

  static Future<ScanModel?> scanAttendout(
      String id, String going, String time, String date) async {
    Response response = await post(
        Uri.parse('$BASE_URL/out.php'),
        body: {'id': id, 'going': going, 'time': time, 'date': date});

    print(response.body);

    if (response.statusCode == 200) {
      try {
        data1 = json.decode(response.body)['response'];
        return ScanModel.fromJson(json.decode(response.body));
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
  }

  static Future<List<AttendModel>> getdata(String id) async {
    Response response =
        await post(Uri.parse('$BASE_URL/alldata.php'), body: {
      'id': id,
    });
    List<AttendModel> flowers = [];
    print(response.body);
    // var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final flowersJsonData =
            json.decode(response.body).cast<Map<String, dynamic>>();
        for (var flower in flowersJsonData) {
          flowers.add(AttendModel.fromJson(flower));
        }
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
    return flowers;
  }

  static Future<ScanModel?> getdatabr(String id, String date) async {
    Response response = await post(
        Uri.parse('$BASE_URL/break.php'),
        body: {'id': id, 'date': date});
    List<ScanModel> flower = [];
    print(response.body);
    // var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        breaktime = json.decode(response.body)['brea'];

        return ScanModel.fromJson(json.decode(response.body));
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
    // return flower;
  }

  static Future<ScanModel?> timeone(String id, String date, String time) async {
    Response response = await post(
        Uri.parse('$BASE_URL/breaktime.php'),
        body: {'id': id, 'date': date, 'time': time});
    print(response.body);
    if (response.statusCode == 200) {
      try {
        print(json.decode(response.body)['response']);
        Fluttertoast.showToast(
            msg: "كل بريك وانت طيب",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            fontSize: 16.0);

        return ScanModel.fromJson(json.decode(response.body));
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
  }

  static Future<ScanModel?> sendmessage(
      String id, String msg, String dat, String hist, String per,String img) async {
    Response response =
        await post(Uri.parse('$BASE_URL/vacations.php'), body: {
      'user_id': id,
      'message': msg,
      'dat': dat,
      'hist': hist,
      'per': per,
      'img' : img
    });
    print(response.body);
    if (response.statusCode == 200) {
      try {
        //signinval=json.decode(response.body)['response'];

        return ScanModel.fromJson(json.decode(response.body));
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
  }

  static Future<List<HoliModel>> getdataholi(String id) async {
    Response response =
        await post(Uri.parse('$BASE_URL/allvacations.php'),
            // headers: headers,
            body: {
          'user_id': id,
        });
    List<HoliModel> flowers = [];
    print(response.body);
    // var response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      try {
        final flowersJsonData =
            json.decode(response.body).cast<Map<String, dynamic>>();
        for (var flower in flowersJsonData) {
          flowers.add(HoliModel.fromJson(flower));
        }
      } catch (err) {
        print(err);
      }
    } else {
      Fluttertoast.showToast(
          msg: 'Some Think Wrong Database',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      //throw Exception('Failed to load data from Server.');
    }
    return flowers;
  }
}
