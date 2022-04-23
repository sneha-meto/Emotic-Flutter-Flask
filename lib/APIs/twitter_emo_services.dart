import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:emoticflutter/Utilities/auth.dart';
import 'package:emoticflutter/Models/emotion_twitter.dart';

class TwitterEmoServices {
  static var client = http.Client();

  var headers = {'X-Api-Key': apiKey, 'Content-Type': 'application/json'};

  Future<EmoTwitter?> fetchTagEmotion(tag) async {
    var body = jsonEncode({"hashtag": tag});
    var response = await client.post(Uri.parse('http://127.0.0.1:5000/emo/tag'),
        headers: headers, body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return emoTwitterFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<EmoTwitter?> fetchUserEmotion(user) async {
    var body = jsonEncode({"username": user});
    var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/emo/user'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return emoTwitterFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
