import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _xaxis =
          prefs.getStringList('ff_xaxis')?.map(double.parse).toList() ?? _xaxis;
    });
    _safeInit(() {
      _yaxis =
          prefs.getStringList('ff_yaxis')?.map(double.parse).toList() ?? _yaxis;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<double> _xaxis = [0.0, 1.57, 3.14, 4.71, 6.28];
  List<double> get xaxis => _xaxis;
  set xaxis(List<double> value) {
    _xaxis = value;
    prefs.setStringList('ff_xaxis', value.map((x) => x.toString()).toList());
  }

  void addToXaxis(double value) {
    xaxis.add(value);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void removeFromXaxis(double value) {
    xaxis.remove(value);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromXaxis(int index) {
    xaxis.removeAt(index);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void updateXaxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    xaxis[index] = updateFn(_xaxis[index]);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInXaxis(int index, double value) {
    xaxis.insert(index, value);
    prefs.setStringList('ff_xaxis', _xaxis.map((x) => x.toString()).toList());
  }

  List<double> _yaxis = [0.0, 1.0, 0.0, -1.0, 0.0];
  List<double> get yaxis => _yaxis;
  set yaxis(List<double> value) {
    _yaxis = value;
    prefs.setStringList('ff_yaxis', value.map((x) => x.toString()).toList());
  }

  void addToYaxis(double value) {
    yaxis.add(value);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void removeFromYaxis(double value) {
    yaxis.remove(value);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromYaxis(int index) {
    yaxis.removeAt(index);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void updateYaxisAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    yaxis[index] = updateFn(_yaxis[index]);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  void insertAtIndexInYaxis(int index, double value) {
    yaxis.insert(index, value);
    prefs.setStringList('ff_yaxis', _yaxis.map((x) => x.toString()).toList());
  }

  List<double> _bleDataList = [];
  List<double> get bleDataList => _bleDataList;
  set bleDataList(List<double> value) {
    _bleDataList = value;
  }

  void addToBleDataList(double value) {
    bleDataList.add(value);
  }

  void removeFromBleDataList(double value) {
    bleDataList.remove(value);
  }

  void removeAtIndexFromBleDataList(int index) {
    bleDataList.removeAt(index);
  }

  void updateBleDataListAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    bleDataList[index] = updateFn(_bleDataList[index]);
  }

  void insertAtIndexInBleDataList(int index, double value) {
    bleDataList.insert(index, value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
