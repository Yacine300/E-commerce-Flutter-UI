import 'package:flutter/material.dart';

import 'package:one/Screen/Detail/component/DetailButton.dart';
import 'package:one/Screen/Detail/component/ProductInfo.dart';

import 'package:one/Composant/SizeConfig.dart';
import 'package:one/providers/products.dart';
import 'package:provider/provider.dart';

import '../../../Composant/server_host.dart';
import '../../../models/Product.dart';
import '../../Home/components/HomeBody.dart';
import 'ColorProduct.dart';
import 'FrontImage.dart';

class DetailBody extends StatefulWidget {
  final String produitID;
  @override
  State<DetailBody> createState() => _DetailBodyState(produitID: produitID);

  const DetailBody({required this.produitID});
}

class _DetailBodyState extends State<DetailBody> {
  final String produitID;
  _DetailBodyState({required this.produitID});

  int _currentIndexSlector = 0;
  String uri = "http://$SERVER_HOST:5000/";
  int _compteur = 01;

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context, listen: false);
    final monProduit = products.findById(produitID);

    SizeConfiguration().init(context);
    return ListView(
      children: [
        FrontImage(
          currentIndexSelector: _currentIndexSlector,
          monProduit: monProduit,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            monProduit.imagesProduit.length,
            (index) => Padding(
              padding: EdgeInsets.only(right: 5, left: 5),
              child: choixImage(
                  imageProduct: monProduit.imagesProduit[index],
                  index: index,
                  url: uri),
            ),
          ),
        ),
        ProductInfo(
          monProduit: monProduit,
        ),
        SizedBox(
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
                          if (_compteur > 1) {
                            _compteur--;
                          }
                        });
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: const Text(
                          "-",
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ),
                    ),
                  ),
                  Text("$_compteur"),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _compteur++;
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
                ],
              ),
            ],
          ),
        ),
        DetailButton(
          compteur: _compteur,
          monProduit: monProduit,
        ),
      ],
    );
  }

  choixImage({imageProduct, index, url}) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndexSlector = index;
        });
      },
      child: Container(
        height: SizeConfiguration.defaultSize * 0.6,
        width: SizeConfiguration.defaultSize * 0.6,
        child: AspectRatio(
          aspectRatio: 40 / 40,
          child: Image.network(url + imageProduct),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
          border: _currentIndexSlector == index
              ? Border.all(color: Colors.deepOrangeAccent)
              : Border.all(color: Colors.white),
        ),
      ),
    );
  }
}
