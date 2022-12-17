import 'package:flutter/material.dart';
import 'package:one/providers/Cart.dart';
import 'package:one/providers/orders.dart';
import 'package:provider/provider.dart';

class ButtonCart extends StatelessWidget {
  final dummyCartItems;

  ButtonCart({this.dummyCartItems});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Orders>(context, listen: false)
            .addOrder(myorder: dummyCartItems);
        Provider.of<Carts>(context, listen: false).purchaseBuy();
      },
      child: const CircleAvatar(
        radius: 25,
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        child: Icon(Icons.shopping_bag_rounded),
      ),
    );
  }
}
