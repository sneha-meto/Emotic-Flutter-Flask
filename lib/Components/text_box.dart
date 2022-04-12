import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final TextInputType textInputType;
  final String hint;
  final TextEditingController controller;
  final String fieldName;

  TextBox({required this.textInputType, required this.hint, required this.controller, required this.fieldName});

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(100.0),
        child: TextFormField(
          obscureText: false,
          autocorrect: false,
          style: TextStyle(color: Colors.white),
          keyboardType: widget.textInputType,
          validator: (value) {},
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {}
            ),
            isDense: true,
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.black87),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Color(0xFF54ABD0),
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Color(0xFF54ABD0),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Color(0xFF54ABD0),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(color: Color(0xFF54ABD0), width: 2),
            ),
          ),
        ),
      ),
    );
  }
}