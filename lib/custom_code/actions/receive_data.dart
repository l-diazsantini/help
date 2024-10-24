// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Import necessary packages
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// Define a map to simulate local state storage
Map<String, dynamic> localStateStorage = {};

// Helper function to get local state
List<double>? getLocalState(String key) {
  // Retrieve the value from the local state storage by key
  return localStateStorage[key] as List<double>?;
}

// Helper function to set local state
void setLocalState(String key, List<double> value) {
  // Store the value in the local state storage by key
  localStateStorage[key] = value;
}

// Your receiveData function
Future<String?> receiveData(BTDeviceStruct deviceInfo) async {
  List<double> chartData =
      getLocalState('bleDataList') ?? []; // Get local state data
  String receivedStringData = ''; // Variable to store the received string data

  try {
    final device = BluetoothDevice.fromId(deviceInfo.id);
    final services = await device.discoverServices();

    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        final isRead = characteristic.properties.read;
        final isNotify = characteristic.properties.notify;

        if (isRead && isNotify) {
          await characteristic.setNotifyValue(true);

          // Listen for notifications from the characteristic
          characteristic.value.listen((value) {
            receivedStringData =
                String.fromCharCodes(value); // Convert value to string

            // Convert received string data to double
            double newData = double.tryParse(receivedStringData) ?? 0;

            chartData.add(newData); // Add the new data point

            // Limit data points to 50
            if (chartData.length > 50) {
              chartData.removeAt(0); // Keep the latest 50 data points
            }

            // Update the local state
            setLocalState('bleDataList', chartData);
          });
        }
      }
    }
  } catch (e) {
    debugPrint('Error receiving data: ${e.toString()}');
  }

  // Return the last received string data
  return receivedStringData;
}
