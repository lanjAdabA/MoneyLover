import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ChartData {
  ChartData(
    this.x,
    this.y,
    this.color,
  );
  final String x;
  final double y;
  final Color color;
}

class BargraphPage extends StatelessWidget {
  final int lastmonthamount;
  final int thismonthamount;
  final String text1;
  final String text2;
  const BargraphPage({
    super.key,
    required this.thismonthamount,
    required this.text1,
    required this.text2,
    required this.lastmonthamount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        height: 180,
        child: SfCartesianChart(
            enableAxisAnimation: true,
            primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(fontSize: 16),
                majorGridLines: const MajorGridLines(width: 0),
                //Hide the axis line of x-axis
                axisLine: const AxisLine(width: 1),
                interval: 1),
            primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.compact(),
              minimum: 0, maximum: thismonthamount + 500,
              interval: 2000,
              majorGridLines: const MajorGridLines(width: 1),
              //Hide the axis line of x-axis
              axisLine: const AxisLine(width: 1),
            ),
            plotAreaBorderWidth: 1,
            legend: Legend(isVisible: false),
            series: <ChartSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                enableTooltip: true,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                dataSource: [
                  ChartData(text1, lastmonthamount.toDouble(),
                      const Color.fromARGB(255, 237, 130, 122)),
                  ChartData(text2, thismonthamount.toDouble(),
                      const Color.fromARGB(255, 205, 52, 41)),
                ],
                xValueMapper: (ChartData data, _) => data.x,
                yValueMapper: (ChartData data, _) => data.y,
                pointColorMapper: (ChartData data, _) => data.color,
              )
            ]),
      ),
    );
  }
}
