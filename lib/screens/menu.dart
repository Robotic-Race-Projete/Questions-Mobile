import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/models/user.notify.dart';
import 'package:provider/provider.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'menu/SignUp.dart';
import 'menu/menuOptions.dart';
import 'menu/title.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MenuPageState();
  }
}

class _MenuPageState extends State<MenuPage> {
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            MenuTitle(), 
            Consumer<UserModel>(
              builder: (context, user, child) {
                return user.isUserSet
                ? MenuOptions()
                : MenuSignUp();
              }
            )
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
      backgroundColor: Colors.lightGreen[100],
    );
  }
}
