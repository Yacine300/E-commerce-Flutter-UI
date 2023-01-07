import 'package:flutter/material.dart';

import 'package:one/Screen/Panier/components/OneItem.dart';
import 'package:one/providers/Cart.dart';
import 'package:one/Composant/SizeConfig.dart';

import 'package:provider/provider.dart';

import 'ButtonCart.dart';
import 'PanierVide.dart';
import 'Total.dart';

class PanierBody extends StatefulWidget {
  @override
  State<PanierBody> createState() => _PanierBodyState();
}

class _PanierBodyState extends State<PanierBody> {
  @override
  Widget build(BuildContext context) {
    final myCart = Provider.of<Carts>(context, listen: false);
    final dummyCartItems = myCart.dummyCartItems;
    final total = myCart.totalClculator();

    SizeConfiguration().init(context);
    return dummyCartItems.length == 0
        ? const PanierVide()
        : Stack(
            children: [
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: dummyCartItems.length,
                  itemBuilder: (context, index) => OneItem(
                        dummyCartItem: dummyCartItems[index],
                        myCart: myCart,
                      )),
              Positioned(
                bottom: SizeConfiguration.defaultSize / 3,
                right: SizeConfiguration.defaultSize / 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Total(currentTotal: total),
                    SizedBox(
                      height: SizeConfiguration.defaultSize / 5,
                    ),
                    ButtonCart(dummyCartItems: dummyCartItems, total: total)
                  ],
                ),
              )
            ],
          );
  }
}
