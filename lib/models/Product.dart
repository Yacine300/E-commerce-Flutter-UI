import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String nom, descreption, type;
  List<Color> couleurProduit;
  List<String> imagesProduit;
  double prix, rating;
  int id;
  bool isLicked = false;

  Product(
      {this.nom,
      this.descreption,
      this.type,
      this.couleurProduit,
      this.imagesProduit,
      this.prix,
      this.rating,
      this.id,
      this.isLicked});
}
