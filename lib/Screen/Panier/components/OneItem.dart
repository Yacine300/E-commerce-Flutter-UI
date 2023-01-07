import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/models/Cart.dart';
import 'package:one/providers/Cart.dart';

import 'OneCartItemBuilder.dart';

class OneItem extends StatelessWidget {
  final Cart dummyCartItem;
  final Carts myCart;

  OneItem({this.dummyCartItem, this.myCart});

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
        key: Key(dummyCartItem.cartProduit.nom),
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
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: const Text('Yes'),
                      ),
                      FlatButton(
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
