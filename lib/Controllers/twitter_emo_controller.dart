import 'package:get/state_manager.dart';
import 'package:emoticflutter/APIs/twitter_emo_services.dart';
import 'package:emoticflutter/Models/emotion_twitter.dart';

class ReportController extends GetxController {
  Future<EmoTwitter?> fetchTagEmotion(tag) async {
    var tagEmotion = await TwitterEmoServices().fetchTagEmotion(tag);
    return tagEmotion;
  }

  Future<EmoTwitter?> fetchUserEmotion(user) async {
    var userSentiment = await TwitterEmoServices().fetchUserEmotion(user);
    return userSentiment;
  }
}
