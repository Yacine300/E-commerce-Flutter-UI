import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:one/models/Cart.dart';
import 'package:http/http.dart' as http;
import 'package:one/models/Product.dart';

import '../Composant/server_host.dart';
import '../models/order.dart';

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
    final List<Order> fetchedData = [];

    final url = Uri.http("$SERVER_HOST:5000", "/orders");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> listData = json.decode(response.body);
      print(listData);

      if (listData.containsKey('result')) {
        List<dynamic> resultList = listData['result'];
        for (final item in resultList) {
          List<Cart> preparedCart = []; // Move the declaration here
          if (item.containsKey('orderProduit') &&
              item['orderProduit'] is List) {
            List<dynamic> orderProduitList = item['orderProduit'];
            for (int i = 0; i < orderProduitList.length; i++) {
              Map<String, dynamic> orderProduit = orderProduitList[i];
              if (orderProduit.containsKey('productName') &&
                  orderProduit.containsKey('_id')) {
                Cart currentCart = Cart(
                  cartProduit: Product(
                    nom: orderProduit['productName'],
                    descreption: orderProduit['productDescreption'],
                    type: orderProduit['productType'],
                    couleurProduit:
                        List<String>.from(orderProduit['productColors']),
                    imagesProduit:
                        List<String>.from(orderProduit['productImages']),
                    prix: orderProduit['productPrice'],
                    rating: orderProduit['productRating'],
                    id: orderProduit['_id'],
                    isLicked: false,
                  ),
                  itemQuantite: 1,
                );
                preparedCart.add(currentCart);
              }
            }
          }
          if (item.containsKey('_id')) {
            fetchedData.add(Order(
              id: item['_id'],
              orderProduit: preparedCart,
              total: item['total'],
            ));
          }
        }
      }
    } else {
      print('Failed to fetch orders. Status code: ${response.statusCode}');
    }

    _items = fetchedData;
    notifyListeners();
  }

  void deleteOrder(String orderId) async {
    final url = Uri.parse('http://$SERVER_HOST:5000/orders/$orderId');
    final response = await http.delete(url);

    if (response.statusCode == 200) {
      final index = _items.firstWhere((order) => order.id == orderId);
      _items.remove(index);
      notifyListeners();
      print('Order deleted successfully');
      // Perform any necessary actions after successful deletion
    } else {
      print('Failed to delete order. Status code: ${response.statusCode}');
      // Handle the failure case appropriately
    }
  }
}
