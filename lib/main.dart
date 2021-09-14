import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/models/lobby.dart';
import 'package:projete_app/models/navigation.dart';
import 'package:projete_app/models/socket.dart';
import 'package:projete_app/screens/lobby.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:provider/provider.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'models/user.dart';

void setupLocator() {
  GetIt.instance.registerSingleton<SocketClient>(SocketClient());
  GetIt.instance.registerSingleton<UserModel>(UserModel());
  GetIt.instance.registerSingleton<NavigationService>(NavigationService());
  GetIt.instance.registerSingleton<LobbyModel>(LobbyModel());
}

void main() {
  setupLocator();
  var userModel = GetIt.instance.get<UserModel>();
  var lobbyModel = GetIt.instance.get<LobbyModel>();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => userModel
        ),
        ChangeNotifierProvider(
          create: (context) => lobbyModel
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
      navigatorKey: GetIt.instance.get<NavigationService>().navigatorKey,
    );
  }
}
