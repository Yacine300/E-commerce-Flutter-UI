import 'package:flutter/material.dart';
import 'package:one/models/Cart.dart';

class Order {
  DateTime id;
  double total;
  List<Cart> orderProduit = [];

  Order({this.id, this.orderProduit, this.total});
}

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  void addOrder({List<Cart> myorder}) {
    DateTime now = DateTime.now();
    final order = Order(id: now, orderProduit: myorder, total: 225.0);
    _items.add(order);

    notifyListeners();
  }

  void deleteOrder({DateTime idByTime}) {
    print(idByTime);
    final index = _items.firstWhere((order) => order.id == idByTime);
    _items.remove(index);
    notifyListeners();
  }
}
