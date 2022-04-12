import 'package:emoticflutter/components/button.dart';
import 'package:emoticflutter/Constants/color.dart';
import 'package:emoticflutter/pages/analysis_query.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text(
                'Emotic',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: Center(
                      child: Container(
                        //width: 600,
                        //height: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network('https://picsum.photos/250?image=9'),
                            //Image.asset("assets/images/logo.jpeg"),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                        child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 600,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'In this course we will go over the basics of using Flutter Web for website development. Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more.',
                                style: TextStyle(
                                  fontSize: 21,
                                ),
                              ),
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Button(
                                        buttonName: "Sentiment Analysis",
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Query()),
                                          );
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: Button(
                                        buttonName: "Emotion Analysis",
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Query()),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
