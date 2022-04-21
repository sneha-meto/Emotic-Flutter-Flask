import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/Components/predominant.dart';
import 'package:emoticflutter/Components/viewall.dart';
import 'package:emoticflutter/Components/piechart.dart';
import 'package:emoticflutter/Components/popular.dart';
import 'package:emoticflutter/Components/predominant.dart';
import 'package:emoticflutter/components/related.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:emoticflutter/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:emoticflutter/Models/sentiment_text.dart';
import 'package:get/get.dart';
import 'package:emoticflutter/Controllers/text_controller.dart';
import 'package:emoticflutter/Controllers/twitter_emo_controller.dart';
import 'package:emoticflutter/Controllers/twitter_senti_controller.dart';

class Report extends StatefulWidget {
  final bool isSenti;
  final String type;
  final String input;
  Report({
    required this.isSenti,
    required this.input,
    required this.type,
  });

  final TextController textController = Get.put(TextController());
  final TwitterSentiController twitterSentiController =
      Get.put(TwitterSentiController());
  final TwitterEmoController twitterEmoController =
      Get.put(TwitterEmoController());

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  callApi(type, input) {
    if (type == "user") {
      if (widget.isSenti) {
        widget.twitterSentiController.fetchUserSentiment(input);
      } else {
        widget.twitterEmoController.fetchUserEmotion(input);
      }
    } else if (type == "tag") {
      if (widget.isSenti) {
        widget.twitterSentiController.fetchTagSentiment(input);
      } else {
        widget.twitterEmoController.fetchTagEmotion(input);
      }
    } else {
      if (widget.isSenti) {
        widget.textController.fetchTextSentiment(input);
      } else {
        widget.textController.fetchTextEmotion(input);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    callApi(widget.type, widget.input);
  }

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
                widget.isSenti
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
                  RoundedContainer(textName: widget.type),
                  RoundedContainer(textName: widget.input),
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
                children: gridChildren(
                  widget.type,
                  widget.isSenti,
                )),
//            widget.type == "text" ? Container() : ViewAll()
          ],
        ),
      ),
    );
  }
}

List<Widget> gridChildren(
  type,
  isSenti,
) {
  if (type == "text") {
    return [
      Predominant(
        isSenti: isSenti,
        type: type,
      ),
    ];
  } else {
    return [
      Predominant(
        isSenti: isSenti,
        type: type,
      ),
      Chart(
        isSentiment: isSenti,
        type: type,
      ),
//      Popular(),
//      Related(),
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
        constraints: BoxConstraints(minWidth: 200, maxWidth: 200),
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
          child: Text(
            textName,
            maxLines: 3,
            style: TextStyle(fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
