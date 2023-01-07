import 'package:flutter/material.dart';

class HeaderOrder extends StatelessWidget {
  final double orderTotal;

  const HeaderOrder({this.orderTotal});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: Colors.deepOrangeAccent,
      child: Center(
        child: Text(
          orderTotal.toString() + " \$",
          maxLines: 2,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
    );
  }
}
