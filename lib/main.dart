import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:projete_app/screens/create-lobby.dart';
import 'package:projete_app/screens/join-lobby.dart';
import 'package:projete_app/screens/menu.dart';
import 'package:projete_app/socket.dart';
import 'package:provider/provider.dart';

import 'models/user.notify.dart';

void main() {
  GetIt.I.registerSingleton<SocketClient>(SocketClient());
  runApp(ChangeNotifierProvider(create: (context) => UserModel(), child: MyApp(),));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MenuPage(),
        '/lobby/create': (context) => CreateLobbyScreen(),
        '/lobby/join': (context) => JoinLobbyScreen()
      }
    );
  }
}
