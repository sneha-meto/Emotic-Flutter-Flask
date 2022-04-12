import 'package:emoticflutter/Constants/color.dart';
import 'package:emoticflutter/components/nav_bar.dart';
import 'package:emoticflutter/components/button.dart';
import 'package:emoticflutter/components/text_box.dart';
import 'package:flutter/material.dart';

class Query extends StatefulWidget {
  const Query({Key? key}) : super(key: key);

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _text = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Center(
        child: Column(
          children: <Widget>[
            NavBar(),
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Button(
                      buttonName: "Text",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Query()),
                        );
                      },
                    ),
                    Button(
                      buttonName: "Tag",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Query()),
                        );
                      },
                    ),
                    Button(
                      buttonName: "Post",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Query()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            TextBox(
                textInputType: TextInputType.text,
                hint: "Text",
                controller: _text,
                fieldName: "Text"),
          ],
        ),
      ),
    );
  }
}
