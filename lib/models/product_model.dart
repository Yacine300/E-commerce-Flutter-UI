import 'package:flutter/material.dart';
import 'package:one/models/api_services.dart';

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

class ProductModel {
  static Future<List<Product>> fetchProduct() async {
    List<Product> fetchedProduct = await ApiServices.fetchProduct();

    return fetchedProduct;
  }

  static Future<Product> createProduct(Product newProduct) async {
    Product product = await ApiServices.createProduct(newProduct);
    return product;
  }
}
