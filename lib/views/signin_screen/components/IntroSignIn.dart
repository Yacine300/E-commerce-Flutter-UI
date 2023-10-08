import 'package:flutter/material.dart';
import 'package:one/utils/size_config.dart';

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
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'GloriaHallelujah'),
            ),
            SizedBox(
              height: SizeConfiguration.defaultSize / 10,
            ),
            Text(
              "wellcome back you have been missed",
              style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w100,
                  fontFamily: 'GloriaHallelujah',
                  color: Colors.grey[600]),
            ),
          ],
        ));
  }
}
