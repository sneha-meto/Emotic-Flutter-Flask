import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  // List data=[];
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: kCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 5),
                //color: kGrey,
                child: Text(
                  'Popular Tweets',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: kCardTitle,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //color: kGrey,
                  child: Center(
                    child: FutureBuilder(
                      future: DefaultAssetBundle.of(context)
                          .loadString('assets/loadjson/details.json'),
                      builder: (context, snapshot) {
                        // Decode the JSON
                        var newData = json.decode(snapshot.data.toString());
                        return ListView.builder(
                          itemCount: newData == null ? 0 : newData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Tweet(
                              user: newData[index]['text'].toString(),
                              userHandle: newData[index]['text'].toString(),
                              text: newData[index]['text'].toString(),
                              time: newData[index]['img'].toString(),
                              reTweet: newData[index]['img'].toString(),
                              comment: newData[index]['text'].toString(),
                              likes: newData[index]['text'].toString(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Tweet extends StatelessWidget {
  final String user;
  final String userHandle;
  final String text;
  final String time;
  final String reTweet;
  final String comment;
  final String likes;

  Tweet(
      {required this.user,
      required this.userHandle,
      required this.text,
      required this.time,
      required this.reTweet,
      required this.comment,
      required this.likes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(width: 2, color: Colors.grey.shade300))),
        child: Column(
          children: [
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Text(user.substring(0, 1)),
                ),
                _tweetContent(),
                FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 20,
                      child: Image.network('https://picsum.photos/250?image=9'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _tweetContent() {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                AutoSizeText(user,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(userHandle + " · $time",
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w500)),
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 5.0),
                child: Text(text,
                    maxLines: 2, style: TextStyle(color: Colors.black))),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.message,
                        color: Colors.black45,
                        size: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child: Text(comment.toString(),
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.repeat, color: Colors.black45, size: 20),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child: Text(reTweet,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite_border,
                          color: Colors.black45, size: 20),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child: Text(likes,
                            style:
                                TextStyle(color: Colors.black45, fontSize: 12)),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
