import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/models/Product.dart';
import 'package:one/Composant/SizeConfig.dart';

class ProductInfo extends StatefulWidget {
  final Product monProduit;

  const ProductInfo({required this.monProduit});
  @override
  State<ProductInfo> createState() => _ProductInfoState(monProduit: monProduit);
}

class _ProductInfoState extends State<ProductInfo> {
  Product monProduit;

  _ProductInfoState({required this.monProduit});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfiguration.defaultSize * 0.2,
          bottom: SizeConfiguration.defaultSize * 0.2),
      child: Container(
        height: 250,
        width: SizeConfiguration.screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfiguration.defaultSize / 4,
              vertical: SizeConfiguration.defaultSize / 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    monProduit.nom,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                      onTap: () {
                        if (monProduit.isLicked == false) {
                          setState(() {
                            monProduit.isLicked = true;
                          });
                        } else {
                          setState(() {
                            monProduit.isLicked = false;
                          });
                        }
                      },
                      child: SizedBox(
                          height: 25,
                          width: 25,
                          child: Icon(
                            monProduit.isLicked == false
                                ? Icons.favorite_outline_outlined
                                : Icons.favorite_outlined,
                            color: monProduit.isLicked == false
                                ? Colors.black
                                : Colors.red,
                          ))),
                ],
              ),
              SizedBox(
                width: SizeConfiguration.screenWidth / 1.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      monProduit.descreption,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfiguration.defaultSize / 7),
                      child: Text(
                        '${monProduit.prix} \$',
                        style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            //  fontFamily: 'GloriaHallelujah',
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
