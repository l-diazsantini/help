import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'oscilloscope_widget.dart' show OscilloscopeWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OscilloscopeModel extends FlutterFlowModel<OscilloscopeWidget> {
  ///  Local state fields for this page.

  List<double> bleDataList = [];
  void addToBleDataList(double item) => bleDataList.add(item);
  void removeFromBleDataList(double item) => bleDataList.remove(item);
  void removeAtIndexFromBleDataList(int index) => bleDataList.removeAt(index);
  void insertAtIndexInBleDataList(int index, double item) =>
      bleDataList.insert(index, item);
  void updateBleDataListAtIndex(int index, Function(double) updateFn) =>
      bleDataList[index] = updateFn(bleDataList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
