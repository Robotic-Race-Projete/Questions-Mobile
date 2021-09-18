import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/models/lobby.dart';
import 'package:projete_app/models/match.model.dart';
import 'package:projete_app/services/socket.dart';
import 'package:projete_app/screens/lobby.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

import 'models/user.dart';


void setupLocator() {
  var socketClient = SocketClient();

  GetIt.instance.registerSingleton<SocketClient>(socketClient);

  socketClient.io.on('game_feed', (data) => Get.snackbar(
    data, '', 
    backgroundColor: Colors.orange,
  ));
}

void main() {
  setupLocator();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel()
        ),
        ChangeNotifierProvider(
          create: (context) => LobbyModel()
        ),
        ChangeNotifierProvider(
          create: (context) => MatchModel(),
        )
      ], 
      child: MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
        backgroundColor: Colors.lightGreen[100]
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuPage(),
        '/lobby': (context) => LobbyScreen(),
      },
      navigatorKey: Get.key,
    );
  }
}
