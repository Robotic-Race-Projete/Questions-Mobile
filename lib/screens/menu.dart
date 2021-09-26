import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/models/car.dart';
import 'package:projete_app/models/user.dart';
import 'package:provider/provider.dart';

import 'menu/SelectCar.dart';
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
  @override
  void initState() {
    super.initState();
  }

  Widget getMenuOptions(BuildContext context) {
    var user = Provider.of<UserModel>(context);
    var car = Provider.of<CarModel>(context);

    if (user.isRegistred) {
      if (car.didPlayerChooseACar) {
        return MenuOptions();
      } else {
        return SelectCarWidget(connections: car.cars);
      }
    } else {
      return MenuSignUp();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            MenuTitle(), 
            getMenuOptions(context)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      )
    );
  }
}
