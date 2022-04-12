import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';

class Predominant extends StatefulWidget {
  const Predominant({Key? key}) : super(key: key);

  @override
  State<Predominant> createState() => _PredominantState();
}

class _PredominantState extends State<Predominant> {
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
                  'Predominant Sentiment',
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://picsum.photos/250?image=9',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "\"it\'s mostly negative\"",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                                color: kRed,
                              ),
                            ),
                          ),
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
