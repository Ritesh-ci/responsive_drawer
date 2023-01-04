import 'package:flutter/material.dart';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

// Define data structure for a bar group
class DataItem {
  int x;
  double y1;
  // double y2;
  // double y3;
  DataItem({
    required this.x,
    required this.y1,
  });
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  // Generate dummy data to feed the chart
  final List<DataItem> _myData = List.generate(
      15,
      (index) => DataItem(
            x: index,
            y1: Random().nextInt(12) + 1,
          ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exapmle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1000,
            child: BarChart(BarChartData(
                maxY: 20,
                // barTouchData: barTouchData,
                gridData: FlGridData(show: false),
                borderData: FlBorderData(
                    border: const Border(
                  top: BorderSide.none,
                  right: BorderSide.none,
                  left: BorderSide(width: 1),
                  bottom: BorderSide(width: 1),
                )),
                // groupsSpace: 5,
                barGroups: _myData
                    .map((dataItem) => BarChartGroupData(
                          x: dataItem.x,
                          barRods: [
                            BarChartRodData(
                                toY: dataItem.y1,
                                width: 15,
                                color: Colors.amber),
                          ],
                          showingTooltipIndicators: [
                            0
                          ], //This is for showing the value on top
                        ))
                    .toList())),
          ),
        ),
      ),
    );
  }
}
