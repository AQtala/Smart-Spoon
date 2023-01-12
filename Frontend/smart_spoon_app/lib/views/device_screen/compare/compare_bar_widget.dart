import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_spoon_app/constants/theme_constants.dart';
import 'package:smart_spoon_app/models/bar_spot.dart';

class CompareBarWidget extends StatelessWidget {
  final List<BarSpot> data;
  final String title;
  const CompareBarWidget({
    Key? key,
    required this.data,
    required this.title,
  }) : super(key: key);

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 6,
    );
    String title =
        data.firstWhere((element) => element.x == value.toInt()).title;
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Text(title, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;
    double minY = data.isNotEmpty
        ? data.reduce((curr, next) => curr.y < next.y ? curr : next).y
        : 0;
    double maxY = data.isNotEmpty
        ? data.reduce((curr, next) => curr.y > next.y ? curr : next).y
        : 0;
    return SizedBox(
      height: size.height * 0.35,
      width: size.width,
      child: Container(
        decoration: BoxDecoration(
          color: _theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(
            20,
          ),
        ),
        margin: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, left: 15, right: 15),
              decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.none, width: 0),
                borderRadius: BorderRadius.circular(25),
                color: Colors.transparent,
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
              width: size.width * 0.9,
              height: size.height * 0.25,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Color(0xff4e4965), width: 4),
                      left: BorderSide(color: Colors.transparent),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  backgroundColor: _theme.colorScheme.primary,
                  gridData: FlGridData(show: true),
                  alignment: BarChartAlignment.center,
                  maxY: maxY,
                  minY: minY,
                  groupsSpace: 30,
                  barTouchData: BarTouchData(enabled: true),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: getTitles,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        interval: maxY - minY > 10 ? 50 : 1,
                        reservedSize: 50,
                        showTitles: true,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                  ),
                  barGroups: data
                      .map(
                        (e) => BarChartGroupData(
                          x: e.x,
                          barRods: [
                            BarChartRodData(
                              toY: e.y,
                              width: size.width * 0.01,
                              gradient: LinearGradient(
                                colors: [
                                  _theme.colorScheme.secondary.withAlpha(150),
                                  COLOR_EXTRA_SECOND.withAlpha(100)
                                ],
                              ),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
