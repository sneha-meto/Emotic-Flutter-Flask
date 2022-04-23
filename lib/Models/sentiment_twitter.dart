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
  List<Tweet> popularTweets;
  List<String> relatedTags;
  List<Tweet> tweets;

  factory SentiTwitter.fromJson(Map<String, dynamic> json) => SentiTwitter(
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
        "popular_tweets":
            List<dynamic>.from(popularTweets.map((x) => x.toJson())),
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

  Map<String, double> getMap() {
    Map<String, double> sentis = {
      "Negative": negative.toDouble(),
      "Neutral": neutral.toDouble(),
      "Positive": positive.toDouble(),
    };
    return sentis;
  }

  String getPredominant() {
    if (negative > neutral && negative > positive)
      return "negative";
    else if (positive > neutral && positive > neutral)
      return "positive";
    else if (neutral > positive && neutral > negative)
      return "neutral";
    else
      return "a tie";
  }
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
  String sentiment;
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
        sentiment: json["sentiment"],
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
        "sentiment": sentiment,
        "subjectivity": subjectivity,
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
