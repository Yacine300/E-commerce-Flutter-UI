import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one/models/cart_model.dart';
import 'package:one/utils/size_config.dart';
import 'package:one/controllers/carts.dart';
import 'package:provider/provider.dart';

import '../../../models/product_model.dart';

class DetailButton extends StatelessWidget {
  final Product monProduit;
  final int compteur;

  const DetailButton({required this.compteur, required this.monProduit});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(
            horizontal: SizeConfiguration.defaultSize / 4,
            vertical: SizeConfiguration.defaultSize / 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.transparent),
        child: customButton(textButton: 'Add to Cart', context: context));
  }

  Widget customButton({required String textButton, BuildContext? context}) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
        Colors.deepOrangeAccent,
      )),
      onPressed: () async {
        Cart targetProduct = Cart(
          cartProduit: monProduit,
          itemQuantite: compteur,
        );
        Provider.of<Carts>(context!, listen: false)
            .addtoCart(targetProduct, monProduit.id);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('product added with success'),
        ));
      },
      child: Text(
        textButton,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'GloriaHallelujah',
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
