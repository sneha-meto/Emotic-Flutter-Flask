import 'package:emoticflutter/Components/simple_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:emoticflutter/Utilities/color.dart';

class TextBox extends StatefulWidget {

  final TextInputType textInputType;
  final String hint;
  final TextEditingController controller;
  final String fieldName;
  final Function iconTapFunction;

  TextBox(
      {required this.textInputType,
      required this.hint,
      required this.controller,
      required this.fieldName,
      required this.iconTapFunction});

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  String? validate(String value, String type) {
    if (value.isEmpty) {
      return 'This field is required';
    }

    switch (type) {

      case "tag":
        Pattern pattern = r"\B#[a-zA-Z0-9]+\b";
        RegExp regex = new RegExp(pattern.toString());
        if (!regex.hasMatch(value) || value == null)
          return 'Enter a valid hashtag';
        break;

      case "user":
        Pattern pattern = r"^@(?=.*\w)[\w]{1,15}$";
        RegExp regex = new RegExp(pattern.toString());
        if (!regex.hasMatch(value) || value == null)
          return 'Enter a valid user name';
        break;
    }

    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          obscureText: false,
          autocorrect: false,
//          style: TextStyle(color: Colors.white),
          keyboardType: widget.textInputType,
          validator: (value) {
            String? result = validate(value!, widget.fieldName);
            return result;
          },
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            suffixIcon: SimpleIconButton(
              tapFunction: widget.iconTapFunction,
            ),
            isDense: true,
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.black54),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: kYellow,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(
                color: kYellow,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: BorderSide(color: kOrange, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
