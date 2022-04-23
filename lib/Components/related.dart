import 'dart:convert';
import 'package:emoticflutter/Utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:emoticflutter/Utilities/controller_services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class Related extends StatelessWidget {
  const Related({Key? key, required this.isSenti, required this.type})
      : super(key: key);

  final bool isSenti;
  final String type;

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
              Obx(
                () => getController(type, isSenti).isLoading.value
                    ? Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: isSenti
                              ? getController(type, isSenti)
                                  .sentiTweet
                                  .relatedTags
                                  .length
                              : getController(type, isSenti)
                                  .emoTweet
                                  .relatedTags
                                  .length,
                          itemBuilder: (BuildContext context, int i) {
                            return TagContainer(
                                textName: isSenti
                                    ? getController(type, isSenti)
                                        .sentiTweet
                                        .relatedTags[i]
                                    : getController(type, isSenti)
                                        .emoTweet
                                        .relatedTags[i]);
                          },
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
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
