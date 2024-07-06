import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/intro/intro.dart';

class StartButton extends StatelessWidget {
  const StartButton();
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(milliseconds: 900),
      slidingBeginOffset: Offset(0, 0),
      slidingCurve: Curves.ease,
      child: SizedBox(
        height: 50,
        width: SizeConfiguration.defaultSize * 2,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(
            Colors.deepOrangeAccent,
          )),
          onPressed: () => Navigator.pushNamed(context, Intro.routeName),
          child: Text(
            "Start now",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'GloriaHallelujah',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
