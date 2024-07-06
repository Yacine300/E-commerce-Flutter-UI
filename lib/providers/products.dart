import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:one/models/Product.dart';
import 'package:http/http.dart' as http;

import '../Composant/server_host.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    /*Product(
      id: "0",
      nom: "OSAF T-shirt",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [
        Color.fromARGB(255, 222, 222, 222),
        Color.fromARGB(255, 71, 71, 71),
        Color.fromARGB(255, 185, 150, 98),
      ],
      imagesProduit: [
        'assets/images/tshirt.png',
        'assets/images/shirt2.png',
        'assets/images/shirt1.png',
      ],
      prix: 35.92,
      rating: 5.0,
      type: "Homme",
      isLicked: false,
    ),
    Product(
      id: "1",
      nom: "Nike RT-28",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [
        Colors.deepPurple[400]!,
        Color.fromARGB(255, 143, 184, 255),
        Color.fromARGB(255, 203, 47, 47),
      ],
      imagesProduit: [
        'assets/images/Nike2.png',
        'assets/images/Nike2 (2).png',
        'assets/images/Nike2 (3).png',
      ],
      prix: 90.5,
      rating: 5.0,
      type: "Fitness",
      isLicked: false,
    ),
    Product(
      id: "2",
      nom: "Rolew watch",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [Colors.grey],
      imagesProduit: [
        'assets/images/Nike3.png',
      ],
      prix: 1425,
      rating: 5.0,
      type: "Fitness",
      isLicked: false,
    ),
    Product(
      id: "3",
      nom: "Ps4 Controller",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [Colors.white, Colors.purple[300]!],
      imagesProduit: [
        'assets/images/ps4_console_white_2.png',
        'assets/images/ps4_console_white_3.png',
        'assets/images/ps4_console_white_4.png',
      ],
      prix: 287.99,
      rating: 5.0,
      type: "Gaming",
      isLicked: false,
    ),*/
  ];

  Future<void> fetchProduct() async {
    final List<Product> fetchedData = [];
    final url = Uri.http("$SERVER_HOST:5000", "/products");
    final response = await http.get(url);

    print(response.body);
    print(response.statusCode);

    Map<String, dynamic> listData = json.decode(response.body);
    print(listData);

    for (final item in listData['result']) {
      print(item['productName']);
      print(item['productDescreption']);
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

    _items = fetchedData;
    notifyListeners();
  }

  Future<void> createProduct(Product newProduct) async {
    final url = Uri.http("$SERVER_HOST:5000", "/products");

    // Convert the new product to JSON
    /* final newProductJson = json.encode({
      'productName': newProduct.nom,
      'productDescreption': newProduct.descreption,
      'productType': newProduct.type,
      'productColors': newProduct.couleurProduit,
      'productImages': newProduct.imagesProduit,
      'productPrice': newProduct.prix,
      'productRating': newProduct.rating,
      'isLicked': newProduct.isLicked,
    });*/

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
        _items.add(newProduct);
      } else {
        print('Failed to create product. Status code: ${response.statusCode}');
        // Handle the failure case appropriately
      }
    } catch (error) {
      print('Error creating product: $error');
      // Handle any network or other errors that occur
    }
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
