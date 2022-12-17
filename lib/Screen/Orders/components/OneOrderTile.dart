import 'package:flutter/material.dart';
import 'package:one/providers/orders.dart';
import 'package:provider/provider.dart';

class OneOrderTile extends StatelessWidget {
  final DateTime orderId;

  OneOrderTile({this.orderId});
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Provider.of<Orders>(context, listen: false)
              .deleteOrder(idByTime: orderId);
        },
        icon: Icon(
          Icons.delete,
        ));
  }
}
