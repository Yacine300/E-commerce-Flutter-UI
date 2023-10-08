import 'dart:convert';

import 'package:http/http.dart';
import 'package:one/models/product_model.dart';

import 'cart_model.dart';
import 'order_model.dart';
import '../utils/constant.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static Future<Product> createProduct(Product newProduct) async {
    final url = Uri.http("$SERVER_HOST:5000", "/products");

    try {
      final request = http.MultipartRequest('POST', url);
      request.headers['Content-Type'] = 'multipart/form-data';

      // Add form data fields
      request.fields['productName'] = newProduct.nom;
      request.fields['productDescreption'] = newProduct.descreption;
      request.fields['productType'] = newProduct.type;
      request.fields['productColors'] = newProduct.couleurProduit.join(",");
      request.fields['productImages'] = newProduct.imagesProduit.join(",");
      request.fields['productPrice'] = newProduct.prix.toString();
      request.fields['productRating'] = newProduct.rating.toDouble().toString();
      request.fields['isLicked'] = newProduct.isLicked.toString();

      // Send the request and await the response
      final response = await request.send();

      if (response.statusCode == 201) {
        print('Product created successfully');
        // Perform any necessary actions after successful product creation
        return newProduct;
      } else {
        print('Error creating product: ${response.statusCode}');
        // Handle server errors or other issues
        throw Exception('Failed to create product');
      }
    } catch (error) {
      print('Error creating product: $error');
      // Handle any network or other errors that occur
      throw error;
    }
  }

  static Future<List<Product>> fetchProduct() async {
    final List<Product> fetchedData = [];
    final url = Uri.http("$SERVER_HOST:5000", "/products");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> listData = json.decode(response.body);

        for (final item in listData['result']) {
          fetchedData.add(Product(
            nom: item['productName'],
            descreption: item['productDescreption'],
            type: item['productType'],
            couleurProduit: List<String>.from(item['productColors']),
            imagesProduit: List<String>.from(item['productImages']),
            prix: item['productPrice'],
            rating: item['productRating'] as double,
            id: item['_id'],
            isLicked: false,
          ));
        }
      } else {
        // Handle server errors (e.g., 404, 500)
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network errors or other issues
      throw Exception('Failed to load products: $error');
    }

    return fetchedData;
  }

  static Future<List<Order>> fetchOrders() async {
    final List<Order> fetchedData = [];

    final url = Uri.http("$SERVER_HOST:5000", "/orders");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> listData = json.decode(response.body);

      if (listData.containsKey('result')) {
        List<dynamic> resultList = listData['result'];
        for (final item in resultList) {
          List<Cart> preparedCart = [];

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
        return fetchedData; // Return the fetched data here.
      } else {
        throw Exception('Failed to fetch orders: Response data format error');
      }
    } else {
      throw Exception(
          'Failed to fetch orders. Status code: ${response.statusCode}');
    }
  }

  static Future<Response> deleteOrder(String orderId) async {
    final url = Uri.parse('http://$SERVER_HOST:5000/orders/$orderId');
    final response = await http.delete(url);
    return response;
  }
}
