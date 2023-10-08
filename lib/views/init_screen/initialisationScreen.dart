import 'package:flutter/material.dart';
import 'package:one/utils/size_config.dart';

class InitScreen extends StatelessWidget {
  static String routeName = "/initialisationScreen.dart";

  const InitScreen();
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      body: Container(
        height: SizeConfiguration.screenHeight,
        width: SizeConfiguration.screenWidth,
        child: Image.asset(
          'assets/images/intro.gif',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
