import 'package:emoticflutter/Utilities/color.dart';
import 'package:flutter/material.dart';
//final kCyan = Color(0xff49C9C4);

class Button extends StatelessWidget {
  final String buttonName;
  final Function onTap;
  double fontSize;
  Color buttonColor;

  Button({
    required this.buttonName,
    required this.onTap,
    this.fontSize = 18,
    this.buttonColor = kOrange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Container(
        color: Colors.transparent,

//        width: 150,
        height: 50,
        child: InkWell(
          onTap: () {
            onTap();
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: buttonColor,
              //gradient: LinearGradient(colors: [kBlue, kCyan])
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  buttonName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
//                      shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)]
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
