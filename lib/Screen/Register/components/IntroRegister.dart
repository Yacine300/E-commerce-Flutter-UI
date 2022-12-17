import 'package:flutter/cupertino.dart';
import 'package:one/Composant/SizeConfig.dart';

class IntroRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SizeConfiguration.defaultSize / 2.2,
            bottom: SizeConfiguration.defaultSize / 1.2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Welcome !",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: SizeConfiguration.defaultSize / 10,
            ),
            const Text(
              "Register on cornucopia",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
            ),
          ],
        ));
  }
}
