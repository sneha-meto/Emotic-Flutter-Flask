import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';

class Predominant extends StatelessWidget {
  final bool isSenti;
  final bool isText;
  final double? subjectivity;
  final String sentiment;

  Map iconPath = {
    "positive": "assets/images/positive.png",
    "neutral": "assets/images/neutral.png",
    "negative": "assets/images/sad.png"
  };

  Predominant(
      {required this.isSenti,
      required this.isText,
      required this.sentiment,
      this.subjectivity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Card(
        elevation: 10,
        color: kCard,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //color: kGrey,
                  child: Text(
                    isSenti ? 'Predominant Sentiment' : 'Predominant Emotion',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      color: kCardTitle,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    //color: kGrey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              iconPath[sentiment],
                              fit: BoxFit.contain,
                            ),
                          ),
                          constraints: BoxConstraints(maxWidth: 160),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  isSenti
                                      ? "It's mostly $sentiment"
                                      : "The predominant emotion is sadness",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: kOrange,
                                  ),
                                ),
                              ),
                              isSenti
                                  ? Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        "Subjectivity : ${subjectivity.toString()}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: kOrange,
                                        ),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
