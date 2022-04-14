import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/components/popular.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';

class ViewAll extends StatefulWidget {
  const ViewAll({Key? key}) : super(key: key);

  @override
  State<ViewAll> createState() => _ViewAllState();
}

class _ViewAllState extends State<ViewAll> {
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
        child: ExpandableListView(),
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
  @override
  _ExpandableListViewState createState() => new _ExpandableListViewState();
}

class _ExpandableListViewState extends State<ExpandableListView> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Container(
          //color: Colors.blue,
          padding: new EdgeInsets.fromLTRB(5, 0, 5, 5),
          child: new Row(
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
              new IconButton(
                  icon: Icon(
                    expandFlag
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.black,
                    size: 30.0,
                  ),
                  onPressed: () {
                    setState(() {
                      expandFlag = !expandFlag;
                    });
                  }),
            ],
          ),
        ),
        new ExpandableContainer(
            expanded: expandFlag,
            child: new ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Tweet(
                  user: "Adheela",
                  userHandle: "@adhee22",
                  text:
                      "In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.",
                );
              },
              //itemCount: 15,
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
    this.expandedHeight = 300.0,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight : collapsedHeight,
      child: new Container(
        child: child,
        //decoration: new BoxDecoration(border: new Border.all(width: 1.0,
        //color: Colors.blue,
        //)),
      ),
    );
  }
}
