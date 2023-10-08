import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/utils/size_config.dart';
import 'package:one/models/cart_model.dart';
import 'package:one/controllers/carts.dart';

import 'OneCartItemBuilder.dart';

class OneItem extends StatelessWidget {
  final Cart dummyCartItem;
  final Carts myCart;

  OneItem({required this.dummyCartItem, required this.myCart});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        background: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.deepOrangeAccent[100]),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/exit.svg"),
                )
              ],
            )),
        key: Key(dummyCartItem.cartProduit.id),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          myCart.delateCartItem(idItemCart: dummyCartItem.cartProduit.id);
        },
        confirmDismiss: (direction) {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: const Text("delete"),
                    content: const Text(
                        "Are you sure you want to delete the product ?"),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(ctx).pop(false);
                          },
                          child: const Text(
                            'No',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ],
                  ));
        },
        child: Padding(
          padding:
              EdgeInsets.symmetric(vertical: SizeConfiguration.defaultSize / 5),
          child: OneCartItemBuilder(dummyCartItems: dummyCartItem),
        ));
  }
}
