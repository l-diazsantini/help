// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future<void> receiveData(BTDeviceStruct deviceInfo) async {
  List<double> chartData = List.from(getLocalState('bleDataList') ??
      []); // Retrieve existing data or initialize empty list

  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isRead = characteristic.properties.read;
        final isNotify = characteristic.properties.notify;

        if (isRead && isNotify) {
          // Enable notifications for continuous data reception
          await characteristic.setNotifyValue(true);

          // Listen for data notifications from the ESP32
          characteristic.value.listen((value) {
            final receivedData = String.fromCharCodes(value);

            // Convert the received data to a double and add to chartData
            double newData =
                double.tryParse(receivedData) ?? 0; // Parse data safely

            chartData.add(newData);

            // Optionally, limit the data points to avoid memory issues
            if (chartData.length > 50) {
              chartData.removeAt(0); // Remove the oldest data point
            }

            // Update the local state in FlutterFlow to reflect the new data
            setLocalState('bleDataList', chartData);
          });
        }
      }
    }
  } catch (e) {
    debugPrint('Error receiving data: ${e.toString()}');
  }
}
