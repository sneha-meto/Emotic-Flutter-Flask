import 'package:emoticflutter/Pages/analysis_query.dart';
import 'package:emoticflutter/components/button.dart';
import 'package:emoticflutter/Utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleYellow,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 10),
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Emotic',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              LayoutBuilder(builder: (_context, constraints) {
                if (constraints.maxWidth > 800) {
                  return Row(
                    children:
                        pageChildren(context, constraints.biggest.width / 2),
                  );
                } else {
                  return Column(
                    children: pageChildren(context, constraints.biggest.width),
                  );
                }
              }),
            ],
          ),
        ),
      )),
    );
  }
}

List<Widget> pageChildren(context, width) {
  return <Widget>[
    Image.asset(
      "assets/images/cover.png",
      width: width,
    ),
    Container(
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Perform sentiment analysis or emotion analysis and generate an analysis report on input text as well as twitter hashtags and user handles. \n\nPick analysis type to get started!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Button(
                    buttonName: "Sentiment Analysis",
                    onTap: () {
                      Get.to(() => QueryPage(
                            isSenti: true,
                          ));
                    },
                  ),
                ),
                Expanded(
                  child: Button(
                    buttonName: "Emotion Analysis",
                    onTap: () {
                      Get.to(() => QueryPage(
                            isSenti: false,
                          ));
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    )
  ];
}
