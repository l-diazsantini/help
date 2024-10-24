// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:fl_chart/fl_chart.dart';
import 'dart:async'; // For Stream

class OscilloscopeGraph extends StatefulWidget {
  final Stream<List<double>> dataStream; // Accept a stream of data

  OscilloscopeGraph({Key? key, required this.dataStream}) : super(key: key);

  @override
  _OscilloscopeGraphState createState() => _OscilloscopeGraphState();
}

class _OscilloscopeGraphState extends State<OscilloscopeGraph> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<double>>(
      stream: widget.dataStream, // Listen to the data stream
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // When the stream has data, plot the graph
          List<double> dataPoints = snapshot.data!;

          return LineChart(
            LineChartData(
              lineBarsData: [
                LineChartBarData(
                  spots: dataPoints.asMap().entries.map((entry) {
                    int idx = entry.key;
                    double value = entry.value;
                    return FlSpot(idx.toDouble(), value);
                  }).toList(),
                  isCurved: true,
                  colors: [Colors.blue],
                  belowBarData: BarAreaData(show: false),
                ),
              ],
              titlesData: FlTitlesData(show: false),
              gridData: FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          );
        } else {
          return CircularProgressIndicator(); // Show loading indicator while waiting for data
        }
      },
    );
  }
}
