import 'package:flutter/material.dart';

import 'package:one/Composant/SecondCustomAppbar.dart';
import 'package:one/Composant/CustomNavBar.dart';
import 'package:one/providers/Cart.dart';
import 'package:one/Composant/enum.dart';
import 'package:one/Screen/Panier/components/PanierBody.dart';

import 'package:provider/provider.dart';

class Panier extends StatelessWidget {
  static String routeName = "/Panier.dart";
  @override
  Widget build(BuildContext context) {
    final carts = Provider.of<Carts>(context);
    final dummyCartItems = carts.dummyCartItems;
    return Scaffold(
      appBar: SecondCustomAppbar(
        dummyCartItems: dummyCartItems,
        title: 'Your cart',
      ),
      body: PanierBody(),
      bottomNavigationBar: CustomBottomNavBar(
        selectedMenu: MenuState.cart,
      ),
    );
  }
}
