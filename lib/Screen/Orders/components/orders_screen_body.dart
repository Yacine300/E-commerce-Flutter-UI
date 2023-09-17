import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Screen/Orders/components/Order.dart';
import 'package:one/models/order.dart';

import 'package:one/providers/orders.dart';
import 'package:provider/provider.dart';

List<Order>? order = [];

class OrdersBody extends StatefulWidget {
  @override
  State<OrdersBody> createState() => _OrdersBodyState();
}

class _OrdersBodyState extends State<OrdersBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchOrderData();
  }

  Future<void> fetchOrderData() async {
    final orders = Provider.of<Orders>(context, listen: false);
    await orders.fetchOrders();

    setState(() {
      order = orders.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return ListView.builder(
        itemCount: order!.length,
        itemBuilder: (context, index) => Padding(
              padding:
                  EdgeInsets.only(bottom: SizeConfiguration.defaultSize / 4),
              child: OneOrder(
                orderId: order![index].id,
                orderTotal: order![index].total,
              ),
            ));
  }
}
