import 'package:get/state_manager.dart';
import 'package:emoticflutter/APIs/text_services.dart';
import 'package:emoticflutter/Models/emotion_text.dart';
import 'package:emoticflutter/Models/sentiment_text.dart';

class TextController extends GetxController {
  SentiText textSentiment = SentiText(sentiment: "neutral", subjectivity: 0.0);

  void fetchTextEmotion(String text) async {
    var textEmotion = await TextServices().fetchTextEmotion(text);
    textEmotion = textEmotion;
  }

  void fetchTextSentiment(String text) async {
    var textSentiment = await TextServices().fetchTextSentiment(text);
    textSentiment = textSentiment;
  }
}
