import 'package:flutter/material.dart';
import 'package:one/models/cart_model.dart';
import '../models/order_model.dart';

class Orders with ChangeNotifier {
  List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  void addOrder(List<Cart> myorder, double total) {
    DateTime now = DateTime.now();
    final order =
        Order(id: now.toString(), orderProduit: myorder, total: total);
    if (!_items.contains(order)) {
      _items.add(order);
    }

    notifyListeners();
  }

  Future<void> fetchOrders() async {
    _items = await OrderModel().fetchOrders();
    notifyListeners();
  }

  void deleteOrder(String orderId) async {
    final response = await OrderModel().deleteOrder(orderId);

    if (response.statusCode == 200) {
      final index = _items.indexWhere((order) => order.id == orderId);
      if (index != -1) {
        _items.removeAt(index);
        notifyListeners();
        print('Order deleted successfully');
        // Perform any necessary actions after successful deletion
      } else {
        print('Order not found in the local list');
        // Handle the case where the order is not found in the local list
      }
    } else if (response.statusCode == 404) {
      print('Order not found on the server. Status code: 404');
      // Handle the case where the order is not found on the server
    } else {
      print('Failed to delete order. Status code: ${response.statusCode}');
      // Handle other error cases appropriately
    }
  }
}
