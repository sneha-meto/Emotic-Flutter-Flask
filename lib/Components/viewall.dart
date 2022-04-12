import 'package:auto_size_text/auto_size_text.dart';
import 'package:emoticflutter/components/popular.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';

class Viewall extends StatefulWidget {
  const Viewall({Key? key}) : super(key: key);

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
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
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: ExpandableListView(
          title: "View All",
        ),
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
  final String title;

  const ExpandableListView({required this.title});

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
          padding: new EdgeInsets.symmetric(horizontal: 5.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              AutoSizeText(
                widget.title,
                maxLines: 2,
                style: new TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold, color: kRed),
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
