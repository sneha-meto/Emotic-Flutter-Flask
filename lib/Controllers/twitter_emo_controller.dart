import 'package:get/state_manager.dart';
import 'package:emoticflutter/APIs/twitter_emo_services.dart';
import 'package:emoticflutter/Models/emotion_twitter.dart';

class TwitterEmoController extends GetxController {
  var emoTweet = EmoTwitter(
      analysis:
          Analysis(joy: 0, anger: 0, fear: 0, love: 0, surprise: 0, sadness: 0),
      count: 0,
      popularTweets: [],
      relatedTags: [],
      tweets: []);

  RxBool isLoading = false.obs;

  void fetchTagEmotion(tag) async {
    isLoading(true);
    var tagEmotion = await TwitterEmoServices().fetchTagEmotion(tag);
    emoTweet = tagEmotion!;
    isLoading(false);
  }

  void fetchUserEmotion(user) async {
    isLoading(true);
    var userEmotion = await TwitterEmoServices().fetchUserEmotion(user);
    emoTweet = userEmotion!;
    isLoading(false);
  }
}
