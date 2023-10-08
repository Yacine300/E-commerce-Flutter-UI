import 'package:flutter/material.dart';
import 'package:one/utils/size_config.dart';
import 'package:one/models/order_model.dart';

import 'package:one/controllers/orders.dart';
import 'package:provider/provider.dart';

import 'Order.dart';

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
    //fetchOrderData();
  }

  Future<void> fetchOrderData() async {
    final orders = Provider.of<Orders>(context, listen: false);
    await orders.fetchOrders();

    order = orders.items;
  }

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context, listen: true);
    SizeConfiguration().init(context);
    return ListView.builder(
      itemCount: orders.items.length,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: SizeConfiguration.defaultSize / 4),
        child: OneOrder(
          orderId: orders.items[index].id,
          orderTotal: orders.items[index].total,
        ),
      ),
    );
  }
}
