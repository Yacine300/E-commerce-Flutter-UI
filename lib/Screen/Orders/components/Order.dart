import 'package:flutter/material.dart';
import 'package:one/Screen/Orders/components/HeaderOrder.dart';
import 'package:one/Screen/Orders/components/OneOrderBody.dart';
import 'package:one/Screen/Orders/components/OneOrderTile.dart';

class OneOrder extends StatelessWidget {
  final double orderTotal;
  final String orderId;

  OneOrder({required this.orderTotal, required this.orderId});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: HeaderOrder(
        orderTotal: orderTotal,
      ),
      title: OneOrderBody(
        orderId: orderId,
      ),
      trailing: OneOrderTile(
        orderId: orderId,
      ),
    );
  }
}
