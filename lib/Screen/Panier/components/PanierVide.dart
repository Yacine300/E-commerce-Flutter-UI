import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class PanierVide extends StatelessWidget {
  const PanierVide();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Oop's it's Emty here",
            style: TextStyle(
                color: Colors.black87,
                fontSize: 30,
                fontFamily: 'GloriaHallelujah'),
          ),
          Image.asset("assets/images/Empty.png"),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfiguration.defaultSize),
            child: Row(
              children: [
                const Text("Click here if you need"),
                SizedBox(
                  width: 10,
                ),
                const Text(
                  "help",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontFamily: 'GloriaHallelujah',
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
