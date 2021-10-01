import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class BluetoothService {
  // lib
  late FlutterBluetoothSerial flutterBlue;

  // Config
  String get password => '6969';

  // Devices
  final List<BluetoothDiscoveryResult> discoveredResults = [];
  // ignore: close_sinks
  final _deviceStreamController = StreamController<List<BluetoothDiscoveryResult>>.broadcast();
  Stream<List<BluetoothDiscoveryResult>> get deviceStream => _deviceStreamController.stream;

  BluetoothService();

  onInit() {
    flutterBlue = FlutterBluetoothSerial.instance;
    removeBoundedDevices();
  }

  Future<void> removeBoundedDevices () async {
    var boundedDevices = await flutterBlue.getBondedDevices();
    await Future.forEach(boundedDevices, (BluetoothDevice device) async {
      await flutterBlue.removeDeviceBondWithAddress(device.address);
    });
  }

  Stream<BluetoothDiscoveryResult> discover () {
    var stream = flutterBlue.startDiscovery().asBroadcastStream();
    stream.listen((event) => _updateDiscovered(event));
    return stream;
  }

  _updateDiscovered (BluetoothDiscoveryResult r) {
    final existingIndex = discoveredResults.indexWhere(
      (element) => element.device.address == r.device.address);
    if (existingIndex >= 0)
      discoveredResults[existingIndex] = r;
    else {
      discoveredResults.add(r);
      _onDeviceFound(r);
    }
  }

  _onDeviceFound(BluetoothDiscoveryResult device) {
    print('Device found: ${device.device.name}, address: ${device.device.address}');
  }

  sendMessage(BluetoothConnection connection, String text) async {
    try {
      print('Sending text: $text');
      connection.output.add(Uint8List.fromList(utf8.encode(text + "\r\n")));
      await connection.output.allSent;
    } catch (error) {
      print(error);
    }
  }

  bondOnDevice () async {
    
  }
}