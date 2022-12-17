import 'package:flutter/material.dart';

class BuildDot extends StatelessWidget {
  final int index, currentIndex;

  const BuildDot({this.index, this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      margin: EdgeInsets.only(right: 11),
      height: 7,
      width: index == currentIndex ? 30 : 7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: index == currentIndex
              ? Colors.deepOrangeAccent
              : Colors.grey[300]),
    );
  }
}
