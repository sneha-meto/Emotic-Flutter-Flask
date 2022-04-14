import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/Components/predominant.dart';
import 'package:emoticflutter/Components/viewall.dart';
import 'package:emoticflutter/components/piechart.dart';
import 'package:emoticflutter/components/popular.dart';
import 'package:emoticflutter/Components/predominant.dart';
import 'package:emoticflutter/components/related.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:emoticflutter/components/nav_bar.dart';
import 'package:flutter/material.dart';

class Report extends StatelessWidget {
  final bool isSenti;
  final String type;
  final String input;
  Report({required this.isSenti, required this.input, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NavBar(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 25,
              ),
              child: Text(
                isSenti
                    ? "Sentiment Analysis Report"
                    : "Emotion Analysis Report",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: kOrange,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundedContainer(textName: type),
                  RoundedContainer(textName: input),
                ],
              ),
            ),
            GridView.extent(
                primary: false,
                padding: const EdgeInsets.all(15),
                maxCrossAxisExtent: 600.0,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: gridChildren(type, isSenti)),
            type == "text" ? Container() : ViewAll()
          ],
        ),
      ),
    );
  }
}

List<Widget> gridChildren(type, isSenti) {
  if (type == "text") {
    return [
      Predominant(isSenti: isSenti),
    ];
  } else {
    return [
      Predominant(isSenti: isSenti),
      Chart(),
      Popular(),
      Related(),
    ];
  }
}

class RoundedContainer extends StatelessWidget {
  final String textName;

  RoundedContainer({
    required this.textName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        constraints: BoxConstraints(minWidth: 200),
        decoration: BoxDecoration(
          color: Colors.white,
//            border: Border.all(width: 3, color: kOrange),
          borderRadius: BorderRadius.all(Radius.circular(50)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: AutoSizeText(
            textName,
            maxLines: 3,
            maxFontSize: 20,
            minFontSize: 1,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
