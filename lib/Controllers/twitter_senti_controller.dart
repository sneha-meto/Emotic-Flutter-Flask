import 'package:get/state_manager.dart';
import 'package:emoticflutter/APIs/twitter_senti_services.dart';
import 'package:emoticflutter/Models/sentiment_twitter.dart';

class TwitterSentiController extends GetxController {
  var sentiTweet = SentiTwitter(
      analysis: Analysis(positive: 0, negative: 0, neutral: 0),
      count: 0,
      popularTweets: [],
      relatedTags: [],
      tweets: []);

  RxBool isLoading = false.obs;

  void fetchTagSentiment(tag) async {
    isLoading(true);

    var tagSentiment = await TwitterSentiServices().fetchTagSentiment(tag);
    sentiTweet = tagSentiment!;
    isLoading(false);
  }

  void fetchUserSentiment(user) async {
    isLoading(true);
    var userSentiment = await TwitterSentiServices().fetchUserSentiment(user);
    sentiTweet = userSentiment!;
    isLoading(false);
  }
}
