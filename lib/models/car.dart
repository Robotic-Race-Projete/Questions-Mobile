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
    cars.clear();
    this.notifyListeners();

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
      var utfEncode = ascii.encode(text + "\r\n");
      var toSend = Uint8List.fromList(utfEncode);
      print("json: $text");
      print("utfEncode: $utfEncode");
      print("toSend: $toSend");
      conCar.output.add(toSend);
      await conCar.output.allSent;
    }
  }

  Future<void> sendCommand(String command, Map<String, dynamic> args) async {
    var toSend = <String, dynamic>{
      'command': command.toUpperCase(),
      ...args
    };
    await sendMessage(jsonEncode(toSend));
  }

  Future<void> chooseCar (BluetoothDiscoveryResult car) async {
    if (!cars.contains(car)) return;

    try {
      var bondState = await bluetooth.flutterBlue.getBondStateForAddress(car.device.address);

      if (bondState != BluetoothBondState.bonded && bondState != BluetoothBondState.bonding) {
        await bluetooth.flutterBlue.bondDeviceAtAddress(
          car.device.address, 
          pin: bluetooth.password
        );
      }

      var connection = await BluetoothConnection.toAddress(car.device.address);
      connection
        .input!
        .listen((event) { })
        .onDone(() {
          if (!connection.isConnected)
            this.chooseCar(car);
        });
      this.connectionCar = connection;
      this.didPlayerChooseACar = true;

      sendCommand('RUN', <String, dynamic>{
          'time': 20
      });

      this.notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}