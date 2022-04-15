import 'package:http/http.dart' as http;
import 'package:emoticflutter/Constants/auth.dart';
import 'package:emoticflutter/Models/sentiment_twitter.dart';

class TwitterSentiServices {
  static var client = http.Client();

  var headers = {'X-Api-Key': apiKey, 'Content-Type': 'application/json'};

  Future<SentiTwitter?> fetchTagSentiment(tag) async {
    var body = '''{\n    "hashtag":$tag\n}''';
    var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/senti/tag'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return sentiTwitterFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<SentiTwitter?> fetchUserSentiment(user) async {
    var body = '''{\n    "username":$user\n}''';
    var response = await client.post(
        Uri.parse('http://127.0.0.1:5000/senti/user'),
        headers: headers,
        body: body);

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return sentiTwitterFromJson(jsonString);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
