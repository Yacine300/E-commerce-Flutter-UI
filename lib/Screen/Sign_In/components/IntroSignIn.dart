import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class IntroSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SizeConfiguration.defaultSize / 2,
            bottom: SizeConfiguration.defaultSize / 1.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hello Again !",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfiguration.defaultSize / 10,
            ),
            Text(
              "wellcome back you have been missed",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ],
        ));
  }
}
