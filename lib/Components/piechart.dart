import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatefulWidget {
  List<Color> colorList=[];

  Chart({Key?key, required this.isSentiment}) : super(key: key);
  final bool isSentiment;
  Map<String, double>  dataMap={};

  @override
  State<Chart> createState() => _ChartState();


}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    if(widget.isSentiment) {
      widget.dataMap = {
        "Positive": 5,
        "Neutral": 2,
        "Negative": 3,
      };
       widget.colorList = <Color>[
        Colors.green.shade400,
        Colors.lightBlue.shade400,
        Colors.red.shade400,
      ];
    }
    else{
      widget.dataMap = {
        "Happy": 5,
        "fear": 2,
        "anger": 3,
        "sad": 2,
        "excited": 3,
      };

      widget.colorList = <Color>[
        Colors.green.shade400,
        Colors.lightBlue.shade400,
        Colors.red.shade400,
        Colors.yellow,
        Colors.pink,
      ];
    }
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
              Expanded(
                child: Container(
                  child: Center(
                    child: PieChart(
                      dataMap: widget.dataMap,
                      colorList: widget.colorList,
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
            ],
          ),
        ),
      ),
    );
  }
}
