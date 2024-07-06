import 'package:flutter/material.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/models/Cart.dart';

class TileItem extends StatelessWidget {
  final Cart dummyCartItems;

  TileItem({required this.dummyCartItems});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfiguration.defaultSize,
      width: SizeConfiguration.screenWidth / 2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfiguration.defaultSize / 4,
            vertical: SizeConfiguration.defaultSize / 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              dummyCartItems.cartProduit.nom,
              style: TextStyle(color: Colors.black87, fontSize: 20),
            ),
            Row(
              children: [
                Text.rich(
                  TextSpan(
                      text: '${dummyCartItems.cartProduit.prix}\$ ',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontWeight: FontWeight.bold)),
                ),
                Text.rich(
                  TextSpan(
                      text: 'x${dummyCartItems.itemQuantite} ',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
