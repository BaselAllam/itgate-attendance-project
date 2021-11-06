import 'package:flutter/material.dart';
import 'package:itgate/theme/shared_color.dart';

class CustomButton extends StatefulWidget {
  final String txt;
  bool isEnabled;
  final Function onTap;

  CustomButton(this.txt, this.isEnabled, this.onTap);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton(
        child: Text('${widget.txt}',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold
                )
              ),
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
              ),
            backgroundColor: widget.isEnabled == true ? primaryColor : Colors.grey,
            fixedSize: Size(MediaQuery.of(context).size.width / 1.1, 40.0)
            ),
        onPressed: () {
          widget.onTap();
        },
      ),
    );
  }
}