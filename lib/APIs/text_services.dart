//import 'package:http/http.dart' as http;
//import 'package:emoticflutter/Constants/auth.dart';
//import 'package:emoticflutter/Models/sentiment_text.dart';
//import 'package:emoticflutter/Models/emotion_text.dart';
//
//class LikesServices {
//  static var client = http.Client();
//
//  var headers = {
//    'X-Api-Key': apiKey,
//    'Content-Type': 'application/json'
//  };
//
//  Future<List<Likes>> fetchLikes(id, page) async {
//    var response = await client.get(
//      Uri.parse(
//          'https://51c046c6-73be-447a-a38c-d999464b1b85.mutualevents.co/api/v1/post/likes/$id/$page/10/'),
//      headers: headers,
//    );
//
//    if (response.statusCode == 200) {
//      var jsonString = response.body;
//      print("like api");
//      return likesFromJson(jsonString);
//    } else {
//      print(response.reasonPhrase);
//      return null;
//    }
//  }
//}
//
//
//
//var request = http.Request('POST', Uri.parse('http://127.0.0.1:5000/senti/tag'));
//request.body = '''{\n    "hashtag":"#ukraine"\n}''';
//request.headers.addAll(headers);
//
//http.StreamedResponse response = await request.send();
//
//if (response.statusCode == 200) {
//print(await response.stream.bytesToString());
//}
//else {
//print(response.reasonPhrase);
//}
