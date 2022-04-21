import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:emoticflutter/Constants/auth.dart';
import 'package:emoticflutter/Models/sentiment_text.dart';
import 'package:emoticflutter/Models/emotion_text.dart';

class TextServices {
  static var client = http.Client();

  var headers = {'X-Api-Key': apiKey, 'Content-Type': 'application/json'};

  Future<SentiText?> fetchTextSentiment(String text) async {
    var body = jsonEncode({"text": text});
    var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/senti/text'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      print(response.body);
      return sentiTextFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<EmoText?> fetchTextEmotion(String text) async {
    var body = jsonEncode({"text": text});
    var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/emo/text'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return emoTextFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
