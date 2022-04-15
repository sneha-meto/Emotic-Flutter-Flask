import 'package:get/state_manager.dart';
import 'package:emoticflutter/APIs/twitter_senti_services.dart';
import 'package:emoticflutter/Models/sentiment_twitter.dart';

class ReportController extends GetxController {
  Future<SentiTwitter?> fetchTagEmotion(tag) async {
    var tagEmotion = await TwitterSentiServices().fetchTagSentiment(tag);
    return tagEmotion;
  }

  Future<SentiTwitter?> fetchUserEmotion(user) async {
    var userSentiment = await TwitterSentiServices().fetchUserSentiment(user);
    return userSentiment;
  }
}
