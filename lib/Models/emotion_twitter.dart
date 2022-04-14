// To parse this JSON data, do
//
//     final emoTwitter = emoTwitterFromJson(jsonString);

import 'dart:convert';

EmoTwitter emoTwitterFromJson(String str) =>
    EmoTwitter.fromJson(json.decode(str));

String emoTwitterToJson(EmoTwitter data) => json.encode(data.toJson());

class EmoTwitter {
  EmoTwitter({
    required this.analysis,
    required this.count,
    required this.popularTweets,
    required this.relatedTags,
    required this.tweets,
  });

  Analysis analysis;
  int count;
  List<double> popularTweets;
  List<String> relatedTags;
  List<Tweet> tweets;

  factory EmoTwitter.fromJson(Map<String, dynamic> json) => EmoTwitter(
        analysis: Analysis.fromJson(json["analysis"]),
        count: json["count"],
        popularTweets:
            List<double>.from(json["popular_tweets"].map((x) => x.toDouble())),
        relatedTags: List<String>.from(json["related_tags"].map((x) => x)),
        tweets: List<Tweet>.from(json["tweets"].map((x) => Tweet.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "analysis": analysis.toJson(),
        "count": count,
        "popular_tweets": List<dynamic>.from(popularTweets.map((x) => x)),
        "related_tags": List<dynamic>.from(relatedTags.map((x) => x)),
        "tweets": List<dynamic>.from(tweets.map((x) => x.toJson())),
      };
}

class Analysis {
  Analysis({
    required this.anger,
    required this.fear,
    required this.joy,
    required this.love,
    required this.sadness,
    required this.surprise,
  });

  int anger;
  int fear;
  int joy;
  int love;
  int sadness;
  int surprise;

  factory Analysis.fromJson(Map<String, dynamic> json) => Analysis(
        anger: json["anger"],
        fear: json["fear"],
        joy: json["joy"],
        love: json["love"],
        sadness: json["sadness"],
        surprise: json["surprise"],
      );

  Map<String, dynamic> toJson() => {
        "anger": anger,
        "fear": fear,
        "joy": joy,
        "love": love,
        "sadness": sadness,
        "surprise": surprise,
      };
}

class Tweet {
  Tweet({
    required this.emotion,
    required this.likes,
    required this.location,
    required this.profilePic,
    required this.retweets,
    required this.screenName,
    required this.text,
    required this.tweetId,
    required this.tweetTime,
    required this.username,
  });

  Emotion? emotion;
  int likes;
  String location;
  String profilePic;
  int retweets;
  String screenName;
  String text;
  double tweetId;
  String tweetTime;
  String username;

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        emotion: emotionValues.map[json["emotion"]],
        likes: json["likes"],
        location: json["location"],
        profilePic: json["profile_pic"],
        retweets: json["retweets"],
        screenName: json["screen_name"],
        text: json["text"],
        tweetId: json["tweet_id"].toDouble(),
        tweetTime: json["tweet_time"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "emotion": emotionValues.reverse[emotion],
        "likes": likes,
        "location": location,
        "profile_pic": profilePic,
        "retweets": retweets,
        "screen_name": screenName,
        "text": text,
        "tweet_id": tweetId,
        "tweet_time": tweetTime,
        "username": username,
      };
}

enum Emotion { JOY, SADNESS }

final emotionValues =
    EnumValues({"joy": Emotion.JOY, "sadness": Emotion.SADNESS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap = {};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
