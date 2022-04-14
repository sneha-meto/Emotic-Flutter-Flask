// To parse this JSON data, do
//
//     final sentiText = sentiTextFromJson(jsonString);

import 'dart:convert';

SentiText sentiTextFromJson(String str) => SentiText.fromJson(json.decode(str));

String sentiTextToJson(SentiText data) => json.encode(data.toJson());

class SentiText {
  SentiText({
    required this.sentiment,
    required this.subjectivity,
  });

  String sentiment;
  double subjectivity;

  factory SentiText.fromJson(Map<String, dynamic> json) => SentiText(
        sentiment: json["sentiment"],
        subjectivity: json["subjectivity"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "sentiment": sentiment,
        "subjectivity": subjectivity,
      };
}
