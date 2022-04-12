import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: kCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //color: kGrey,
                child: Text(
                  'Popular Tweets',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: kRed,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  //color: kGrey,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Tweet(
                          user: "Adheela",
                          userHandle: "@adhee22",
                          text:
                              "In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.",
                        ),
                        Tweet(
                          user: "Adheela",
                          userHandle: "@adhee22",
                          text:
                              "In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.",
                        ),
                        Tweet(
                          user: "Adheela",
                          userHandle: "@adhee22",
                          text:
                              "In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.",
                        ),
                      ],
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

  Tweet({required this.user, required this.userHandle, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(21, 32, 43, 1.0),
            border: Border(bottom: BorderSide())),
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
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: AutoSizeText(userHandle + " · 30m",
                        maxLines: 2, style: TextStyle(color: Colors.grey[400])),
                  ),
                )
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 5.0),
                child: AutoSizeText(text,
                    maxLines: 2, style: TextStyle(color: Colors.white))),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.message, color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child:
                            Text("15", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.repeat, color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child:
                            Text("15", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite_border, color: Colors.white),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child:
                            Text("15", style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                  Icon(Icons.share, color: Colors.white)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
