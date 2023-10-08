import 'package:flutter/material.dart';
import 'package:one/utils/size_config.dart';
import 'package:one/models/cart_model.dart';
import 'package:one/controllers/carts.dart';

import '../../../utils/constant.dart';

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
      child:
          Image.network(URI + dummyCartItems.cartProduit.imagesProduit.first),
    );
  }
}
