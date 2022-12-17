import 'package:flutter/material.dart';

import 'package:one/Composant/SecondCustomAppbar.dart';
import 'package:one/providers/Cart.dart';
import 'package:one/Composant/enum.dart';
import 'package:one/Screen/Panier/components/PanierBody.dart';

import 'package:provider/provider.dart';

import 'package:one/Composant/CustomNavBar.dart';

class Panier extends StatefulWidget {
  static String routeName = "/Panier.dart";
  @override
  State<Panier> createState() => _PanierState();
}

class _PanierState extends State<Panier> {
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
