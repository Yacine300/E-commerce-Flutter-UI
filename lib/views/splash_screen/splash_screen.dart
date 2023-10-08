import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';
import '../start_screen/Start_Screen.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Start(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(body: Image.asset("assets/images/intro.gif"));
  }
}
