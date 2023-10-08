import 'dart:io';
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class Products with ChangeNotifier {
  List<Product> _items = [];

  Future<List<Product>> fetchProduct() async {
    _items = await ProductModel.fetchProduct();
    notifyListeners();
    return _items;
  }

  Future<void> createProduct(Product newProduct) async {
    _items.add(await ProductModel.createProduct(newProduct));
    notifyListeners();
  }

  List<Product> get items {
    return [..._items];
  }

  Product findById(String produitID) {
    return _items.firstWhere((element) => element.id == produitID);
  }

  Future<String> getDeviceIpAddress() async {
    for (var interface in await NetworkInterface.list()) {
      for (var address in interface.addresses) {
        if (!address.isLoopback) {
          if (address.type == InternetAddressType.IPv4) {
            return address.address;
          }
        }
      }
    }
    return '';
  }

  void heratState(int produitID) {
    bool lickedState =
        _items.firstWhere((element) => element.id == produitID).isLicked;
    lickedState = !lickedState;
    notifyListeners();
  }
}
