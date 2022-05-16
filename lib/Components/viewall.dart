import 'dart:convert';
import 'package:emoticflutter/Components/popular.dart';
import 'package:emoticflutter/Utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:emoticflutter/Utilities/controller_services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class ViewAll extends StatelessWidget {
  const ViewAll({Key? key, required this.isSenti, required this.type})
      : super(key: key);
  final bool isSenti;
  final String type;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        width: screenWidth,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: kCard,
            //border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(2, 2), // changes position of shadow
              ),
            ]),
        child: ExpandableListView(isSenti: isSenti, type: type),
        /*child: AutoSizeText(
          widget.textName,
          maxLines: 3,
          maxFontSize: 20,
          minFontSize: 1,
          style: TextStyle(fontSize: 20.0),
        ),*/
      ),
    );
  }
}

class ExpandableListView extends StatefulWidget {
//  List tweets;
  final bool isSenti;
  final String type;

  ExpandableListView({required this.isSenti, required this.type});
  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;
  List getTweets() {
    if (widget.isSenti) {
      return getController(widget.type, widget.isSenti).sentiTweet.tweets;
    } else {
      return getController(widget.type, widget.isSenti).emoTweet.tweets;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          //color: Colors.blue,
          padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                expandFlag ? "All Tweets" : "View all tweets",
                maxLines: 2,
                style: expandFlag
                    ? TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: kCardTitle)
                    : TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: kCardTitle),
              ),
              InkWell(
                  child: Icon(
                    expandFlag
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onTap: () {
                    setState(() {
                      expandFlag = !expandFlag;
                    });
                  }),
            ],
          ),
        ),
        ExpandableContainer(
            expanded: expandFlag,
            child: Obx(
              () => getController(widget.type, widget.isSenti).isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: getTweets().length,
                      itemBuilder: (BuildContext context, int i) {
                        var tweets = getTweets();
                        return TweetContainer(
                          tweet: tweets[i],
                        );
                      },
                      itemExtent: 120,
                      shrinkWrap: true,
                    ),
            )),
      ],
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 400.0,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
//      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: Container(
        child: child,
      ),
    );
  }
}
