import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:one/utils/size_config.dart';

class ItemSplash extends StatelessWidget {
  final String text, subText, image;

  const ItemSplash(
      {required this.image, required this.text, required this.subText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: SizeConfiguration.defaultSize * 0.1,
              left: SizeConfiguration.defaultSize - 60,
              right: SizeConfiguration.defaultSize - 60),
          child: SizedBox(
            height: SizeConfiguration.defaultSize * 2.5,
            width: SizeConfiguration.defaultSize * 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TyperAnimatedText(text,
                        textStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            fontFamily: 'GloriaHallelujah'),
                        speed: Duration(milliseconds: 70)),
                  ],
                  totalRepeatCount: 1,
                ),
                SizedBox(
                  height: 20,
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
