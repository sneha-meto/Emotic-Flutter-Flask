import 'package:emoticflutter/Constants/color.dart';
import 'package:emoticflutter/components/nav_bar.dart';
import 'package:emoticflutter/components/text_box.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:emoticflutter/Pages/report.dart';
import 'package:get/get.dart';
import 'package:emoticflutter/Controllers/text_controller.dart';

enum QueryType { tag, text, user }

class QueryPage extends StatefulWidget {
  QueryPage({Key? key, required this.isSenti}) : super(key: key);
  final bool isSenti;
  final TextController textController = Get.put(TextController());

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  QueryType queryType = QueryType.text;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleYellow,
      body: Center(
        child: Column(
          children: <Widget>[
            NavBar(),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              constraints: BoxConstraints(maxWidth: 900),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 25,
                        horizontal: 25,
                      ),
                      child: Text(
                        widget.isSenti
                            ? "Sentiment Analysis"
                            : "Emotion Analysis",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: kOrange,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                queryType = QueryType.text;
                              });
                            },
                            child: SelectorButton(
                              name: " Input text ",
                              isActive: queryType == QueryType.text,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                queryType = QueryType.tag;
                              });
                            },
                            child: SelectorButton(
                              name: " Hashtag ",
                              isActive: queryType == QueryType.tag,
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                queryType = QueryType.user;
                              });
                            },
                            child: SelectorButton(
                                name: " Username ",
                                isActive: queryType == QueryType.user),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              constraints: BoxConstraints(maxWidth: 800),
              child: TextBox(
                  textInputType: TextInputType.text,
                  hint: "Input query here..",
                  controller: _text,
                  fieldName: "Text",
                  iconTapFunction: () {
                    widget.textController.fetchTextSentiment(_text.text);

                    Get.to(() => Report(
                          isSenti: widget.isSenti,
                          input: _text.text,
                          type: queryType.name,
                          response: widget.textController.textSentiment,
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectorButton extends StatelessWidget {
  final String name;
  final bool isActive;

  SelectorButton({required this.name, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(7),
      child: Container(
        color: Colors.transparent,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: isActive ? kYellow : kOrange,
            //gradient: LinearGradient(colors: [kBlue, kCyan])
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(
                  color: isActive ? kOrange : Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
//                      shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2)]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
