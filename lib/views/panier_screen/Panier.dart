import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:one/views/components/custom_nav_bar.dart';
import 'package:one/controllers/carts.dart';
import 'package:one/utils/enum.dart';

import 'package:provider/provider.dart';

import '../../utils/size_config.dart';
import '../../controllers/orders.dart';
import 'components/PanierBody.dart';

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
