import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/models/Cart.dart';
import 'package:one/providers/Cart.dart';

class HeaderItem extends StatelessWidget {
  final Cart dummyCartItems;
  HeaderItem({required this.dummyCartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfiguration.defaultSize,
      width: SizeConfiguration.defaultSize,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22), color: Colors.grey[200]),
      child: Image.network("http://192.168.218.2:5000/" +
          dummyCartItems.cartProduit.imagesProduit.first),
    );
  }
}
