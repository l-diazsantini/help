// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'dart:async'; // Import for StreamController

final StreamController<String> _dataStreamController =
    StreamController<String>();

// Expose the stream so it can be used in the widget
Stream<String> get dataStream => _dataStreamController.stream;

Future<void> receiveData(BTDeviceStruct deviceInfo) async {
  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isRead = characteristic.properties.read;
        final isNotify = characteristic.properties.notify;

        // If the characteristic supports notifications, enable them
        if (isNotify) {
          await characteristic.setNotifyValue(true);

          // Listen for characteristic value changes
          characteristic.value.listen((value) {
            // Convert the value to a string
            final receivedData = String.fromCharCodes(value);

            // Push the new data to the stream
            _dataStreamController.add(receivedData);
          });
        }
      }
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}
