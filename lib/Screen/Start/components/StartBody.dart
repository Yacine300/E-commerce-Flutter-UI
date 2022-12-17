import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';

import 'FooterSlider.dart';

import 'dummy_start_data.dart';
import 'item_splash.dart';

class StartBody extends StatefulWidget {
  @override
  State<StartBody> createState() => _StartBodyState();
}

class _StartBodyState extends State<StartBody> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            itemCount: startData.length,
            itemBuilder: (context, index) => ItemSplash(
              image: startData[index]["image"],
              text: startData[index]["Bigtext"],
              subText: startData[index]["subText"],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: FooterSlider(
              currentIndex: _currentIndex,
            )),
      ],
    );
  }
}
