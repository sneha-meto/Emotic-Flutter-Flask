import 'package:emoticflutter/Constants/color.dart';
import 'package:emoticflutter/pages/report.dart';
import 'package:flutter/material.dart';

class Related extends StatefulWidget {
  const Related({Key? key}) : super(key: key);

  @override
  State<Related> createState() => _RelatedState();
}

class _RelatedState extends State<Related> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //color: kGrey,
                child: Text(
                  'Related Hashtags',
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
                        Box(textName: "#KingdomHearts20THanniversary"),
                        Box(textName: "#KingdomHearts20THanniversary"),
                        Box(textName: "#KingdomHearts20THanniversary"),
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
