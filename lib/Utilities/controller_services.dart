import 'package:get/get.dart';
import 'package:emoticflutter/Controllers/text_controller.dart';
import 'package:emoticflutter/Controllers/twitter_emo_controller.dart';
import 'package:emoticflutter/Controllers/twitter_senti_controller.dart';

final TextController textController = Get.find();
final TwitterSentiController twitterSentiController = Get.find();
final TwitterEmoController twitterEmoController = Get.find();

String getOverallSentiment(type, isSenti) {
  if (type == "user") {
    if (isSenti) {
      return twitterSentiController.sentiTweet.analysis.getPredominant();
    } else {
      return twitterEmoController.emoTweet.analysis.getPredominant();
    }
  } else if (type == "tag") {
    if (isSenti) {
      return twitterSentiController.sentiTweet.analysis.getPredominant();
    } else {
      return twitterEmoController.emoTweet.analysis.getPredominant();
    }
  } else {
    if (isSenti) {
      return textController.textSentiment.sentiment;
    } else {
      return textController.textEmotion.sentiment;
    }
  }
}

dynamic getController(type, isSenti) {
  if (type != "text") {
    if (isSenti) {
      return twitterSentiController;
    } else {
      return twitterEmoController;
    }
  } else {
    return textController;
  }
}
