import 'package:emoticflutter/Utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emoticflutter/Controllers/text_controller.dart';
import 'package:emoticflutter/Controllers/twitter_emo_controller.dart';
import 'package:emoticflutter/Controllers/twitter_senti_controller.dart';
import 'package:emoticflutter/Models/sentiment_twitter.dart';
import 'package:emoticflutter/Utilities/controller_services.dart';
import 'package:emoticflutter/Utilities/paths.dart';

class Predominant extends StatelessWidget {
  final bool isSenti;
  final String type;

//  final TextController textController = Get.find();
//  final TwitterSentiController twitterSentiController = Get.find();
//  final TwitterEmoController twitterEmoController = Get.find();

  Predominant({
    Key? key,
    required this.isSenti,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isText = type == "text";

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
                Obx(
                  () => getController(type, isSenti).isLoading.value
                      ? Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: Center(child: CircularProgressIndicator()))
                      : Expanded(
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
                                      iconPath[
                                          getOverallSentiment(type, isSenti)],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  constraints: BoxConstraints(maxWidth: 160),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          isSenti
                                              ? "It's mostly ${getOverallSentiment(type, isSenti)}"
                                              : "The predominant emotion is ${getOverallSentiment(type, isSenti)}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: kOrange,
                                          ),
                                        ),
                                      ),
                                      isSenti
                                          ? isText
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    "Subjectivity : ${getController(type, isSenti).textSentiment.subjectivity.toStringAsPrecision(3)}",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: kOrange,
                                                    ),
                                                  ),
                                                )
                                              : Container()
                                          : Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
