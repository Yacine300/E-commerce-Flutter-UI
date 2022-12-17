import 'package:flutter/material.dart';

class OneOrderBody extends StatelessWidget {
  final DateTime orderId;

  OneOrderBody({this.orderId});
  @override
  Widget build(BuildContext context) {
    return Text(
      orderId.toString(),
      style: TextStyle(fontSize: 14),
    );
  }
}
