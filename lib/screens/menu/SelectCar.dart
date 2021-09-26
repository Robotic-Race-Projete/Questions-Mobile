import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:projete_app/models/car.dart';
import 'package:provider/provider.dart';

class SelectCarWidget extends StatelessWidget {
  final List<BluetoothDiscoveryResult> connections;

  SelectCarWidget({
    required this.connections
  });

  @override
  Widget build(BuildContext context) {
    final carModel = Provider.of<CarModel>(context);

    final mapConnectionToText = (BluetoothDiscoveryResult connection) => Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () => carModel.chooseCar(connection),
        child: Text(
          connection.device.name ?? "Error", 
          style: TextStyle(fontSize: 20)
        ),
        style: ElevatedButton.styleFrom(
          // minimumSize: Size(width - 30, 40),
          padding: EdgeInsets.symmetric(horizontal: 20)
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Text(
                  'Escolha seu carro!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24
                  ),
                ),
                ElevatedButton(
                  onPressed: () => carModel.discover(),
                  child: Text('Procurar novamente', style: TextStyle(fontSize: 16)),
                )
              ],
            ),
          ),
          ...connections.map(mapConnectionToText).toList()
        ],
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}