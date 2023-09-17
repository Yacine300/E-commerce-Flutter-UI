import 'package:flutter/material.dart';
import 'package:one/models/Cart.dart';

import 'HeaderItem.dart';
import 'TileItem.dart';

class OneCartItemBuilder extends StatelessWidget {
  final Cart dummyCartItems;

  OneCartItemBuilder({required this.dummyCartItems});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: HeaderItem(
              dummyCartItems: dummyCartItems,
            ),
          ),
          TileItem(
            dummyCartItems: dummyCartItems,
          ),
        ],
      ),
    );
  }
}
