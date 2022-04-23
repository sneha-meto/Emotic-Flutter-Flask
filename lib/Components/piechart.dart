import 'package:emoticflutter/Utilities/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:emoticflutter/Utilities/controller_services.dart';

class Chart extends StatelessWidget {
  Chart({Key? key, required this.isSenti, required this.type})
      : super(key: key);
  final bool isSenti;
  final String type;

//  final Map<String, double> dataMap = {
//    "negative": 6,
//    "neutral": 3,
//    "positive": 1,
//  };

  final List<Color> colorList = <Color>[
    Colors.red.shade400,
    Colors.lightBlue.shade400,
    Colors.green.shade400,
  ];

//  final Map<String, double> dataMap2 = {
//    "anger": 2,
//    "fear": 4,
//    "joy": 5,
//    "love": 4,
//    "sadness": 9,
//    "surprise": 1,
//  };

  final List<Color> colorList2 = <Color>[
    Colors.red.shade400,
    Colors.black45,
    Colors.yellow.shade400,
    Colors.pink.shade400,
    Colors.blue.shade400,
    Colors.green.shade400,
  ];

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
                  child: Text(
                'Overall Sentiment',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: kCardTitle,
                ),
              )),
              Obx(
                () => getController(type, isSenti).isLoading.value
                    ? Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: Center(child: CircularProgressIndicator()))
                    : Expanded(
                        child: Container(
                          child: Center(
                            child: PieChart(
                              dataMap: isSenti
                                  ? getController(type, isSenti)
                                      .sentiTweet
                                      .analysis
                                      .getMap()
                                  : getController(type, isSenti)
                                      .emoTweet
                                      .analysis
                                      .getMap(),
                              colorList: isSenti ? colorList : colorList2,
                              chartType: ChartType.disc,
                              //centerText: "HYBRID",
                              legendOptions: LegendOptions(
                                showLegendsInRow: false,
                                legendPosition: LegendPosition.right,
                                showLegends: true,
                                legendShape: BoxShape.circle,
                                legendTextStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
