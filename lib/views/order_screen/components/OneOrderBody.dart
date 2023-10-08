import 'package:flutter/material.dart';

class OneOrderBody extends StatelessWidget {
  final String orderId;

  OneOrderBody({required this.orderId});
  @override
  Widget build(BuildContext context) {
    return Text(
      orderId.toString(),
      style: TextStyle(fontSize: 14),
    );
  }
}
