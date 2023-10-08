import 'package:http/http.dart';
import 'package:one/models/cart_model.dart';

import "package:one/models/api_services.dart";

class Order {
  String id;
  double total;
  List<Cart> orderProduit = [];

  Order({required this.id, required this.orderProduit, required this.total});
}

class OrderModel {
  Future<List<Order>> fetchOrders() async {
    List<Order> fetchedOrders = await ApiServices.fetchOrders();
    return fetchedOrders;
  }

  Future<Response> deleteOrder(String orderId) async {
    final response = await ApiServices.deleteOrder(orderId);
    return response;
  }
}
