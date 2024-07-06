import 'package:one/models/Cart.dart';

class Order {
  String id;
  double total;
  List<Cart> orderProduit = [];

  Order({required this.id, required this.orderProduit, required this.total});
}
