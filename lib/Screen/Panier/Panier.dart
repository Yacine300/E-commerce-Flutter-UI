import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:one/Composant/SecondCustomAppbar.dart';
import 'package:one/Composant/CustomNavBar.dart';
import 'package:one/providers/Cart.dart';
import 'package:one/Composant/enum.dart';
import 'package:one/Screen/Panier/components/PanierBody.dart';

import 'package:provider/provider.dart';

import '../../Composant/SizeConfig.dart';
import '../../providers/orders.dart';

class Panier extends StatelessWidget {
  static String routeName = "/Panier.dart";
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<Carts>(context, listen: true);
    final dummyCartItems = carts.dummyCartItems;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[50],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            "assets/icons/return.svg",
          ),
        ),
        titleSpacing: SizeConfiguration.defaultSize,
        title: Column(
          children: [
            Text(
              'Panier',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            dummyCartItems != null
                ? Text(
                    '${dummyCartItems.length} item',
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  )
                : const SizedBox(
                    height: 5,
                  ),
          ],
        ),
        actions: [
          dummyCartItems != null
              ? IconButton(
                  onPressed: () {
                    Provider.of<Orders>(context, listen: false)
                        .addOrder(dummyCartItems, 0);
                    Provider.of<Carts>(context, listen: false).purchaseBuy();

                    ///Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black87,
                  ))
              : const SizedBox(
                  width: 10,
                ),
        ],
      ),
      body: PanierBody(myCart: carts),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.cart,
      ),
    );
  }
}
