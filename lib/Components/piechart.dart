import 'package:emoticflutter/Constants/color.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  Map<String, double> dataMap = {
    "Positive": 5,
    "Neutral": 2,
    "Negative": 3,
  };

  final colorList = <Color>[
    Colors.green.shade400,
    Colors.lightBlue.shade400,
    Colors.red.shade400,
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
              Expanded(
                child: Container(
                  child: Center(
                    child: PieChart(
                      dataMap: dataMap,
                      colorList: colorList,
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
