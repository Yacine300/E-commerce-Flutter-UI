import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one/models/Product.dart';

class ColorProduct extends StatelessWidget {
  final Product monProduit;
  ColorProduct({this.monProduit});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
            monProduit.couleurProduit.length,
            (index) => Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: CircleAvatar(
                      backgroundColor: monProduit.couleurProduit[index]),
                )));
  }
}
