import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

class ItemSplash extends StatelessWidget {
  final String text, subText, image;

  const ItemSplash({this.image, this.text, this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfiguration.defaultSize / 3,
              left: SizeConfiguration.defaultSize - 60),
          child: SizedBox(
            height: SizeConfiguration.defaultSize * 2,
            width: SizeConfiguration.defaultSize * 3,
            child: Column(
              children: [
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  maxLines: 2,
                ),
                Text(
                  subText,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                  maxLines: 4,
                ),
              ],
            ),
          ),
        ),
        Container(
          width: SizeConfiguration.defaultSize * 3,
          height: SizeConfiguration.defaultSize * 3,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
