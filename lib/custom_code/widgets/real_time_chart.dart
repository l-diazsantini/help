// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class RealTimeChart extends StatefulWidget {
  final List<double> data;
  final double width; // Add width parameter
  final double height; // Add height parameter

  const RealTimeChart({
    Key? key,
    required this.data,
    required this.width, // Ensure width is required
    required this.height, // Ensure height is required
  }) : super(key: key);

  @override
  _RealTimeChartState createState() => _RealTimeChartState();
}

class _RealTimeChartState extends State<RealTimeChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width, // Use the provided width
      height: widget.height, // Use the provided height
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <LineSeries<double, int>>[
          LineSeries<double, int>(
            dataSource: widget.data,
            xValueMapper: (double value, int index) => index,
            yValueMapper: (double value, int index) => value,
          ),
        ],
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
