import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one/models/Cart.dart';
import 'package:one/models/Product.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/providers/Cart.dart';
import 'package:provider/provider.dart';

class DetailButton extends StatelessWidget {
  final Product monProduit;
  final int compteur;

  const DetailButton({this.compteur, this.monProduit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfiguration.screenWidth,
      margin: EdgeInsets.symmetric(
          horizontal: SizeConfiguration.defaultSize / 4,
          vertical: SizeConfiguration.defaultSize / 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Colors.white),
      child: FlatButton(
          onPressed: () async {
            Cart targetProduct = Cart(
              cartProduit: monProduit,
              itemQuantite: compteur,
            );
            Provider.of<Carts>(context, listen: false).addtoCart(
                targetProduct: targetProduct, produitId: monProduit.id);

            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('product added with success'),
            ));
          },
          child: const Text(
            'Add to cart',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
    );
  }
}
