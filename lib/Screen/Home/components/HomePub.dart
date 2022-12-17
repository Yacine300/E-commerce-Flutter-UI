import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class Pub extends StatelessWidget {
  @override
  const Pub();
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Stack(
        children: [
          Container(
              height: SizeConfiguration.defaultSize,
              width: SizeConfiguration.defaultSize * 3.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: <Color>[
                      // Colors.grey[350],
                      Colors.purple[300],
                      Colors.deepOrangeAccent,
                      Colors.deepOrangeAccent[200],
                      Colors.amberAccent,
                      Colors.amberAccent[200]
                    ],
                    tileMode: TileMode.mirror),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: SizeConfiguration.defaultSize / 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "November surprise",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Cachback 35%",
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
