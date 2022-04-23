import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/Utilities/color.dart';
import 'package:emoticflutter/Utilities/controller_services.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:emoticflutter/Utilities/time.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:emoticflutter/Utilities/paths.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key, required this.isSenti, required this.type})
      : super(key: key);

  final bool isSenti;
  final String type;

  List getTweets() {
    if (isSenti) {
      return getController(type, isSenti).sentiTweet.popularTweets;
    } else {
      return getController(type, isSenti).emoTweet.popularTweets;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: kCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 5),
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
            Obx(
              () => getController(type, isSenti).isLoading.value
                  ? Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Center(child: CircularProgressIndicator()))
                  : Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: ListView.builder(
                            itemCount: getTweets().length,
                            itemBuilder: (BuildContext context, int i) {
                              var tweets = getTweets();
                              return TweetContainer(
                                tweet: tweets[i],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class TweetContainer extends StatelessWidget {
  final tweet;

  TweetContainer({required this.tweet});

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
                  radius: 20.0,
                  backgroundImage: NetworkImage(tweet.profilePic),
                  backgroundColor: Colors.transparent,
                ),
                _tweetContent(),
                FittedBox(
                  child: SizedBox(
                    height: 35,
                    child: Image.asset(iconPath[tweet.sentiment]),
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
                AutoSizeText(tweet.screenName,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    child: Text(
                        tweet.username + " · ${getTime(tweet.tweetTime)}",
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
                child: Text(tweet.text,
                    maxLines: 2, style: TextStyle(color: Colors.black))),
            Container(
              margin: EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.favorite_border,
                          color: Colors.black45, size: 20),
                      Container(
                        margin: EdgeInsets.only(left: 3.0),
                        child: Text(tweet.likes.toString(),
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
                        child: Text(tweet.retweets.toString(),
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
