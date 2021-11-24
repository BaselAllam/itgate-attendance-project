import 'dart:io';
import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/widgets/snack_bar.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';




class ScanQr extends StatefulWidget {
  const ScanQr({ Key? key }) : super(key: key);

  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }


  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Scan Qr Code',
            style: primaryBlackFontStyle,
          ),
          iconTheme: IconThemeData(color: secondaryColor, size: 20.0),
        backgroundColor: Colors.white,
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            SizedBox(height: 30.0),
            TextButton(
              child: Text(
                'Scan',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                backgroundColor: secondaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))
              ),
              onPressed: () {
                try{
                  if(result == null) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(snack('Code Scaned Succefully', Colors.green));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(snack('Try Again', Colors.red));
                  }
                }catch(e) {
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(snack('Some Thing Went Wrong Try Again', Colors.red));
                }
              },
            ),
          ]
        ),
      ),
    );
  }
}