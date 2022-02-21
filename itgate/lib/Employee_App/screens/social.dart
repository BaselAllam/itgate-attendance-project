
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'package:flutter/material.dart';
class SecondPage extends StatefulWidget {
  String something;
  SecondPage(this.something);
  @override
  State<StatefulWidget> createState() {
    return SecondPageState(this.something);
  }
}
class SecondPageState extends State<SecondPage> {
  String something;
  SecondPageState(this.something);
  @override
   void initState() {
     super.initState();
     // Enable virtual display.
    //  if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }

   @override
   Widget build(BuildContext context) {
     return WebView(
       initialUrl: something,
     );
   }
 }