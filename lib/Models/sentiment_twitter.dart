// To parse this JSON data, do
//
//     final sentiTwitter = sentiTwitterFromJson(jsonString);

import 'dart:convert';

SentiTwitter sentiTwitterFromJson(String str) =>
    SentiTwitter.fromJson(json.decode(str));

String sentiTwitterToJson(SentiTwitter data) => json.encode(data.toJson());

class SentiTwitter {
  SentiTwitter({
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

  factory SentiTwitter.fromJson(Map<String, dynamic> json) => SentiTwitter(
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
    required this.negative,
    required this.neutral,
    required this.positive,
  });

  int negative;
  int neutral;
  int positive;

  factory Analysis.fromJson(Map<String, dynamic> json) => Analysis(
        negative: json["negative"],
        neutral: json["neutral"],
        positive: json["positive"],
      );

  Map<String, dynamic> toJson() => {
        "negative": negative,
        "neutral": neutral,
        "positive": positive,
      };
}

class Tweet {
  Tweet({
    required this.likes,
    required this.location,
    required this.profilePic,
    required this.retweets,
    required this.screenName,
    required this.sentiment,
    required this.subjectivity,
    required this.text,
    required this.tweetId,
    required this.tweetTime,
    required this.username,
  });

  int likes;
  String location;
  String profilePic;
  int retweets;
  String screenName;
  Sentiment? sentiment;
  double subjectivity;
  String text;
  double tweetId;
  String tweetTime;
  String username;

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        likes: json["likes"],
        location: json["location"],
        profilePic: json["profile_pic"],
        retweets: json["retweets"],
        screenName: json["screen_name"],
        sentiment: sentimentValues.map[json["sentiment"]],
        subjectivity: json["subjectivity"].toDouble(),
        text: json["text"],
        tweetId: json["tweet_id"].toDouble(),
        tweetTime: json["tweet_time"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "likes": likes,
        "location": location,
        "profile_pic": profilePic,
        "retweets": retweets,
        "screen_name": screenName,
        "sentiment": sentimentValues.reverse[sentiment],
        "subjectivity": subjectivity,
        "text": text,
        "tweet_id": tweetId,
        "tweet_time": tweetTime,
        "username": username,
      };
}

enum Sentiment { POSITIVE, NEUTRAL, NEGATIVE }

final sentimentValues = EnumValues({
  "negative": Sentiment.NEGATIVE,
  "neutral": Sentiment.NEUTRAL,
  "positive": Sentiment.POSITIVE
});

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
