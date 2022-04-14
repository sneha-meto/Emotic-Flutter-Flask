// To parse this JSON data, do
//
//     final emoText = emoTextFromJson(jsonString);

import 'dart:convert';

EmoText emoTextFromJson(String str) => EmoText.fromJson(json.decode(str));

String emoTextToJson(EmoText data) => json.encode(data.toJson());

class EmoText {
  EmoText({
    required this.sentiment,
  });

  String sentiment;

  factory EmoText.fromJson(Map<String, dynamic> json) => EmoText(
        sentiment: json["sentiment"],
      );

  Map<String, dynamic> toJson() => {
        "sentiment": sentiment,
      };
}
