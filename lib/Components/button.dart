import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';
//final kCyan = Color(0xff49C9C4);

class Button extends StatefulWidget {
  final String buttonName;
  final Function onTap;

  Button({
    required this.buttonName,
    required this.onTap,
  });

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _hasBeenPressed = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        color: Colors.transparent,
        width: 150,
        height: 50,
        child: InkWell(
          onTap: (() {
            setState(() {
              _hasBeenPressed = !_hasBeenPressed;
            });
            widget.onTap();
          }),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: _hasBeenPressed ? kRed : kGrey,
              //gradient: LinearGradient(colors: [kBlue, kCyan])
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.buttonName,
                  style: TextStyle(
                      color: Colors.white,
                      //fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
