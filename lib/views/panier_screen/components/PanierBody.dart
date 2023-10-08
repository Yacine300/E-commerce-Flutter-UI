import 'package:flutter/material.dart';

import 'package:one/controllers/carts.dart';
import 'package:one/utils/size_config.dart';

import 'package:provider/provider.dart';

import 'ButtonCart.dart';
import 'OneItem.dart';
import 'PanierVide.dart';
import 'Total.dart';

class PanierBody extends StatefulWidget {
  final Carts myCart;
  PanierBody({required this.myCart});
  @override
  State<PanierBody> createState() => _PanierBodyState();
}

class _PanierBodyState extends State<PanierBody> {
  @override
  Widget build(BuildContext context) {
    final dummyCartItems = widget.myCart.dummyCartItems;
    final total = widget.myCart.totalClculator();

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
                        myCart: widget.myCart,
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
