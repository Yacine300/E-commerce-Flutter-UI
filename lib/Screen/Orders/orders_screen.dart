import 'package:flutter/material.dart';

import 'package:one/Composant/CustomNavBar.dart';

import 'package:one/Composant/enum.dart';

import 'package:one/Screen/Orders/components/orders_screen_body.dart';
import 'package:one/Composant/SecondCustomAppbar.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/orderScreen.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondCustomAppbar(
        title: 'Your transaction',
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.order,
      ),
      body: OrdersBody(),
    );
  }
}
