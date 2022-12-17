import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/intro/intro.dart';

class StartButton extends StatelessWidget {
  const StartButton();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfiguration.defaultSize / 2,
      width: SizeConfiguration.defaultSize * 2,
      child: FlatButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () => Navigator.pushNamed(context, Intro.routeName),
        child: Text(
          "Start now",
          style: TextStyle(
              color: Colors.white,
              fontSize: SizeConfiguration.defaultSize / 4,
              fontFamily: 'roboto',
              fontWeight: FontWeight.bold),
        ),
        color: Colors.deepOrangeAccent,
      ),
    );
  }
}
