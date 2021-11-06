import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_font_style.dart';
import 'package:itgate/theme/shared_color.dart';


ListTile fields(String title, String hint, TextInputType textInputType, TextEditingController controller, Key key, Function onChanged, {bool secure = false, Widget suffix = const SizedBox()}) {
  return ListTile(
    title: Text('$title', style: primaryBlackFontStyle),
    subtitle: Container(
      margin: EdgeInsets.only(top: 10.0),
      height: 50.0,
      child: TextFormField(
        key: key,
        validator: (value) {
          
        },
        decoration: InputDecoration(
          border: outlineInputBorder(secondaryColor),
          focusedBorder: outlineInputBorder(secondaryColor),
          errorBorder: outlineInputBorder(Colors.red),
          hintText: '$hint',
          hintStyle: subTextStyle,
          suffixIcon: suffix
        ),
        keyboardType: textInputType,
        textInputAction: TextInputAction.done,
        controller: controller,
        obscureText: secure,
        onChanged: (value) {
          onChanged();
        },
      ),
    ),
  );
}

OutlineInputBorder outlineInputBorder(Color color) {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: BorderSide(color: color, width: 1.5)
    );
}