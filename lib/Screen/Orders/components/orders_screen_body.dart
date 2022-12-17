import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Screen/Orders/components/Order.dart';

import 'package:one/providers/orders.dart';
import 'package:provider/provider.dart';

class OrdersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context).items;
    SizeConfiguration().init(context);
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) => Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfiguration.defaultSize / 4),
              child: OneOrder(
                orderId: orders[index].id,
                orderTotal: orders[index].total,
              ),
            ));
  }
}
