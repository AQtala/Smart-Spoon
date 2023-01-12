import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_spoon_app/constants/theme_constants.dart';

class ChartWidget extends StatelessWidget {
  final List<FlSpot> data;
  final String title;
  const ChartWidget({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.35,
      width: size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              border: Border.all(style: BorderStyle.solid, width: 0),
              borderRadius: BorderRadius.circular(25),
              color: _theme.colorScheme.primary.withAlpha(100),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: _theme.colorScheme.onBackground,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.8,
            height: size.height * 0.25,
            child: LineChart(
              LineChartData(
                minX: 0,
                minY: -180,
                maxX: (data.length - 1) * 1,
                maxY: 180,
                backgroundColor: _theme.colorScheme.primary,
                gridData: FlGridData(
                  show: true,
                  getDrawingHorizontalLine: (value) => FlLine(
                      color: _theme.colorScheme.background, strokeWidth: 0),
                  getDrawingVerticalLine: (value) => FlLine(
                      color: _theme.colorScheme.background, strokeWidth: 0),
                ),
                lineBarsData: [
                  LineChartBarData(
                      spots: data,
                      barWidth: 2,
                      isCurved: true,
                      show: true,
                      color: _theme.colorScheme.secondary,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            _theme.colorScheme.secondary.withAlpha(75),
                            COLOR_EXTRA_SECOND.withAlpha(75)
                          ],
                        ),
                      ),
                      // ignore: constant_identifier_names
                      dotData: FlDotData(show: false)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
