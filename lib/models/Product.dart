import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String nom, descreption, type;
  List<String> couleurProduit;
  List<String> imagesProduit;
  double prix, rating;
  String id;
  bool isLicked = false;

  Product(
      {required this.nom,
      required this.descreption,
      required this.type,
      required this.couleurProduit,
      required this.imagesProduit,
      required this.prix,
      required this.rating,
      required this.id,
      required this.isLicked});
}
