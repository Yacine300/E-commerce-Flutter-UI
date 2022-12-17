import 'package:flutter/material.dart';

class InitScreen extends StatelessWidget {
  static String routeName = "/initialisationScreen.dart";

  const InitScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepOrangeAccent,
        child: Center(
          child: Text(
            'Cornucopia',
            style: TextStyle(color: Colors.white, fontSize: 64),
          ),
        ),
      ),
    );
  }
}
