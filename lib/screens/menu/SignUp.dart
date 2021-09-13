import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projete_app/models/user.notify.dart';
import 'package:provider/provider.dart';

/// Part of menu
/// 
/// Handles user nickname
class MenuSignUp extends StatefulWidget {
  const MenuSignUp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MenuSignUpState();
  }
}

class _MenuSignUpState extends State<MenuSignUp> {
  final nicknameController = TextEditingController();

  setNickname(BuildContext context, String newNickname) {
    Provider.of<UserModel>(context, listen: false).setNickname(newNickname);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nicknameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      onSubmitted: (value) => setNickname(context, value),
      controller: nicknameController,
      style: TextStyle(fontSize: 30),
    );

    double width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Text("Crie um nickname", style: TextStyle(fontSize: 30, color: Colors.green)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: textField,
        ),
        ElevatedButton(
          onPressed: () => this.setNickname(context, nicknameController.text),
          child: Text("Enviar", style: TextStyle(fontSize: 20),),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(width - 30, 40),
            padding: EdgeInsets.symmetric(horizontal: 20)
          ),
        )
      ]
    );
  }
}
