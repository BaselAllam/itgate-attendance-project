import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';
import 'package:itgate/theme/shared_font_style.dart';




class ScanQr extends StatefulWidget {
  const ScanQr({ Key? key }) : super(key: key);

  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
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
      // use qr code scanner using camera
    );
  }
}