import 'package:emoticflutter/pages/home_view.dart';
import 'package:emoticflutter/pages/report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emoticflutter/Pages/analysis_query.dart';
import 'package:emoticflutter/Utilities/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
      theme: ThemeData(
        fontFamily: "Roboto",
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
        splashColor: Colors.transparent,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: kPaleYellow,
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}
