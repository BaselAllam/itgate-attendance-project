import 'package:itgate/Employee_App/api/api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'dart:convert';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';

class SendMsg extends StatefulWidget {
  const SendMsg({Key? key}) : super(key: key);

  @override
  _SendMsgState createState() => _SendMsgState();
}

class _SendMsgState extends State<SendMsg> {

  XFile? selectedfile;
  // Response response;
  String? progress;
  //Dio dio = new Dio();

  selectFile() async {
    selectedfile = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {}); //update the UI so that file name is shown
  }

  uploadFile() async {
    final uploadurl = Uri.parse("${Api.BASE_URL}/file_upload.php");

    String filename1 = basename(selectedfile!.path);
    print(filename1);
    try {
      var formData = new dio.FormData.fromMap({
        "name": 'ghjk',
        "image": await dio.MultipartFile.fromFile(selectedfile!.path,
            filename: filename1),
      });
      dio.Response response = await dio.Dio()
          .post("${Api.BASE_URL}/file_upload.php", data: formData);
      print(response);
    } catch (e) {}
  }
  String initialValue = 'Choose the period of leave';

  var itemList = [
    'Choose the period of leave',
    'Full Day',
    'Half a day from the beginning',
    'Half a day from the end',
    'Emergency',
    'Patients',
  ];

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  TextEditingController textcontroll = TextEditingController();
  String? date;
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('h:mma ').format(now);
    date = DateFormat('EEE_dd_MMM').format(now);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[700],
        ),
        body: Center(
          child: ListView(

              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: 300,
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[350]),
                    child: Center(
                        child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Container(height: 15,),
                        Image.asset(
                          'assets/EmployeeApp/hol.png',
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .75,
                          decoration: BoxDecoration(
                              // borderRadius:BorderRadius.circular(10),
                              color: Colors.grey),
                          child: DropdownButton(
                            isExpanded: true,
                            iconEnabledColor: Colors.white,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                            dropdownColor: Colors.blue[900],
                            focusColor: Colors.black,
                            value: initialValue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: itemList.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                initialValue = newValue!;
                              });
                            },
                          ),
                        ),
                        initialValue == 'Patients'
                            ? ElevatedButton(
                                onPressed: () {
                                  // CustomFilePicker
                                  selectFile();
                                },
                                child: Text('Select Roshta'),
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.orange, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                              )
                            : Text(""),

                        SizedBox(
                          height: 5.0,
                        ),
                        ElevatedButton(
                          onPressed: () => _selectDate(context),
                          child: Text('Select date'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        ),
                        Text("${selectedDate.toLocal()}".split(' ')[0] +
                            initialValue), //Container(height: 30,),
                        TextField(
                          controller: textcontroll,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (textcontroll.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: 'write your message+${Api.id}',
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              if (initialValue == 'Patients') {
                                uploadFile();
                              }
                              Api.sendmessage(
                                  Api.id,
                                  textcontroll.text,
                                  date!,
                                  "${selectedDate.toLocal()}".split(' ')[0],
                                  initialValue,
                                  initialValue == 'Patients' ? selectedfile!.path : ''
                                  );
                            }
                          },
                          child: Text('send '),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange, // background
                            onPrimary: Colors.white, // foreground
                          ),
                        )
                      ],
                    ))),
              ]),
        ));
  }
}