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
  List<Tweet> popularTweets;
  List<String> relatedTags;
  List<Tweet> tweets;

  factory EmoTwitter.fromJson(Map<String, dynamic> json) => EmoTwitter(
        analysis: Analysis.fromJson(json["analysis"]),
        count: json["count"],
        popularTweets: List<Tweet>.from(
            json["popular_tweets"].map((x) => Tweet.fromJson(x))),
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

  Map<String, double> getMap() {
    Map<String, double> emos = {
      "Anger": anger.toDouble(),
      "Fear": fear.toDouble(),
      "Joy": joy.toDouble(),
      "Love": love.toDouble(),
      "Sadness": sadness.toDouble(),
      "Surprise": surprise.toDouble()
    };
    return emos;
  }

  String getPredominant() {
    Map<String, int> emos = {
      "anger": anger,
      "fear": fear,
      "joy": joy,
      "love": love,
      "sadness": sadness,
      "surprise": surprise
    };
    var sorted = Map.fromEntries(
        emos.entries.toList()..sort((e1, e2) => e1.value.compareTo(e2.value)));
    var keys = sorted.keys.toList();
    if (emos[keys[keys.length - 1]] == emos[keys[keys.length - 2]]) {
      return "a tie";
    } else {
      return keys[keys.length - 1];
    }
  }
}

class Tweet {
  Tweet({
    required this.sentiment,
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

  String sentiment;
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
        sentiment: json["sentiment"],
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
        "sentiment": sentiment,
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
