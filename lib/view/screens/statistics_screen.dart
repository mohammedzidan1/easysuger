import 'package:easysugar/view/custom_widet/custom_curve.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SttisticsScreen extends StatelessWidget {
  const SttisticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            CustomBackground(),
            SafeArea(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios,
                      color: Colors.black.withOpacity(.5))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100, left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(
                    text: "Statistics",
                    color: Colors.black,
                    fontSise: 40,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .34,
                    width: MediaQuery.of(context).size.width * .9,
                    margin: const EdgeInsets.all(10),
                    // elevation: 4,
                    // shape: RoundedRectangleBorder(
                    //   borderRadius: BorderRadius.circular(32),
                    // ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: LineChartWidget(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}

class LineChartWidget extends StatelessWidget {
  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    // Colors.black
    const Color(0xff02d39a),
  ];

  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 15,
          titlesData: LineTitles.getTitleData(),
          gridData: FlGridData(
            show: false,
            getDrawingHorizontalLine: (value) {
              return FlLine(
                //  color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
            drawVerticalLine: true,
            getDrawingVerticalLine: (value) {
              return FlLine(
                color: const Color(0xff37434d),
                strokeWidth: 1,
              );
            },
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: const Color(0xff37434d), width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 3),
                const FlSpot(2.6, 2),
                const FlSpot(4.9, 5),
                const FlSpot(6.8, 2.5),
                const FlSpot(8, 4),
                const FlSpot(9.5, 3),
                const FlSpot(11, 4),
              ],
              isCurved: true,
              // color: gradientColors,
              barWidth: 2,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                  show: true, color: const Color.fromARGB(255, 5, 150, 136)),
            ),
          ],
        ),
      );
}

class LineTitles {
  static getTitleData() => FlTitlesData(bottomTitles: AxisTitles());
}
