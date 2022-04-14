import 'package:flutter/material.dart';
import 'package:emoticflutter/Constants/color.dart';

class SimpleIconButton extends StatefulWidget {
  final Function tapFunction;

  SimpleIconButton({Key? key, required this.tapFunction}) : super(key: key);

  @override
  State<SimpleIconButton> createState() => _SimpleIconButtonState();
}

class _SimpleIconButtonState extends State<SimpleIconButton> {
  Color iconColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          widget.tapFunction();
        },
        onHover: (isHover) {
          if (isHover) {
            setState(() {
              iconColor = kOrange;
            });
          } else {
            setState(() {
              iconColor = Colors.grey;
            });
          }
        },
        child: Icon(
          Icons.settings,
          color: iconColor,
        ));
  }
}
