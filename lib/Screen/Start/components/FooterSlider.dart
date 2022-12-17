import 'package:flutter/material.dart';

import 'BuildDot.dart';
import 'StartButton.dart';
import 'dummy_start_data.dart';

class FooterSlider extends StatelessWidget {
  final int currentIndex;

  const FooterSlider({this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              startData.length,
              (index) => BuildDot(
                    index: index,
                    currentIndex: currentIndex,
                  )),
        ),
        const Spacer(
          flex: 2,
        ),
        const StartButton(),
        const Spacer()
      ],
    );
  }
}
