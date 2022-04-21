import 'package:get/state_manager.dart';
import 'package:emoticflutter/APIs/text_services.dart';
import 'package:emoticflutter/Models/emotion_text.dart';
import 'package:emoticflutter/Models/sentiment_text.dart';

class TextController extends GetxController {
  var textSentiment = SentiText(sentiment: "neutral", subjectivity: 0.0);
  var textEmotion = EmoText(
    sentiment: "neutral",
  );

  RxBool isLoading = false.obs;

  void fetchTextEmotion(String text) async {
    isLoading(true);
    var textEmo = await TextServices().fetchTextEmotion(text);
    textEmotion = textEmo!;
    isLoading(false);
  }

  void fetchTextSentiment(String text) async {
    isLoading(true);
    var textSenti = await TextServices().fetchTextSentiment(text);
    textSentiment = textSenti!;
    isLoading(false);
  }
}
