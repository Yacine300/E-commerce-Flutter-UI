import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one/models/Product.dart';
import 'package:one/Composant/SizeConfig.dart';

import 'ColorProduct.dart';

class SelectorColorQuantity extends StatefulWidget {
  final Product monProduit;
  final int compteur;
  const SelectorColorQuantity({this.compteur, this.monProduit});

  @override
  State<SelectorColorQuantity> createState() =>
      _SelectorColorQuantityState(compteur: compteur, monProduit: monProduit);
}

class _SelectorColorQuantityState extends State<SelectorColorQuantity> {
  final Product monProduit;
  int compteur;
  _SelectorColorQuantityState({this.compteur, this.monProduit});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfiguration.screenHeight / 8,
      width: SizeConfiguration.screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // color

          ColorProduct(
            monProduit: monProduit,
          ),

          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      compteur++;
                    });
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Text(
                      "+",
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ),
                ),
              ),
              Text("${compteur}"),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (compteur > 1) {
                        compteur--;
                      }
                    });
                  },
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: const Text(
                      "-",
                      style: TextStyle(fontSize: 30, color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
