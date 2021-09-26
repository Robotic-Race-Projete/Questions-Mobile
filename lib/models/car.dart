import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/services/bluetoothService.dart';

class CarModel extends ChangeNotifier {
  var bluetooth = GetIt.I.get<BluetoothService>();

  bool didPlayerChooseACar = false;
  BluetoothConnection? connectionCar;
  List<BluetoothDiscoveryResult> cars = [];

  CarModel() {
    discover();
  }

  discover() async {
    await bluetooth.removeBoundedDevices();
    bluetooth.discover()
      .where((event) => event.device.name?.startsWith('CAR') ?? false)
      .listen((r) {
        final existingIndex = cars.indexWhere(
          (element) => element.device.address == r.device.address);

        if (existingIndex >= 0) {
          cars[existingIndex] = r;
        }
        else {
          this.cars.add(r);
        }
        this.notifyListeners();
      });
  }

  Future<void> sendMessage(String text) async {
    var conCar = connectionCar;
    if (conCar != null) {
      var toSend = Uint8List.fromList(utf8.encode(text + "\r\n"));
      conCar.output.add(toSend);
      await conCar.output.allSent;
    }
  }

  Future<void> sendCommand(String command, Map<String, dynamic> args) async {
    var toSend = <String, dynamic>{
      'command': command.toUpperCase(),
      ...args
    };
    await sendMessage(toSend.toString());
  }

  void chooseCar (BluetoothDiscoveryResult car) async {
    if (cars.contains(car)) {
      if (!car.device.isBonded) {
        await bluetooth.flutterBlue.bondDeviceAtAddress(
          car.device.address, 
          pin: bluetooth.password
        );
      }
      if (car.device.isConnected) {
        await bluetooth.flutterBlue.removeDeviceBondWithAddress(car.device.address);
      }
      connectionCar = await BluetoothConnection.toAddress(car.device.address);

      this.didPlayerChooseACar = true;

      sendCommand('RUN', <String, dynamic>{
          'time': 20
      });

      this.notifyListeners();
    }
  }
}