import 'package:flutter/material.dart';
import 'package:one/models/Cart.dart';

class Carts with ChangeNotifier {
  List<Cart> _dummyCartItems = [];

  List<Cart> get dummyCartItems {
    return [..._dummyCartItems];
  }

  double get total {
    return _total;
  }

  double _total = 0.0;

  void addtoCart({Cart targetProduct, int produitId}) {
    // _dummyCartItems.forEach((cart) {
    // if (cart.cartProduit.id == produitId) {
    // print(cart.cartProduit.id);
    // } else {
    _dummyCartItems.add(targetProduct);
    // }
    // }
    // );

    notifyListeners();
  }

  void purchaseBuy() {
    _dummyCartItems.clear();
    _total = 0.0;
    notifyListeners();
  }

  void delateCartItem({idItemCart}) {
    final produitDismiss = _dummyCartItems
        .firstWhere((produit) => produit.cartProduit.id == idItemCart);
    _dummyCartItems.remove(produitDismiss);
    notifyListeners();
  }

  double totalClculator() {
    _total = 0.0;
    _dummyCartItems.forEach((cart) {
      _total += cart.itemQuantite * cart.cartProduit.prix;
    });
    return _total;
  }
}
