import 'package:emoticflutter/Constants/color.dart';
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
      elevation: 10,
      color: kCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
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
                    fontWeight: FontWeight.w700,
                    color: kCardTitle,
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
                        TagContainer(textName: "#KingdomHearts20THanniversary"),
                        TagContainer(textName: "#KingdomHearts20THanniversary"),
                        TagContainer(textName: "#Kingdomersary"),
                        TagContainer(textName: "#KingdomHearts20THanniversary"),
                        TagContainer(textName: "#Kary"),
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

class TagContainer extends StatelessWidget {
  final String textName;

  TagContainer({
    required this.textName,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          decoration: BoxDecoration(
            color: kOrange,
//            border: Border.all(width: 3, color: kOrange),
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: Text(
            textName,
            maxLines: 3,
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
