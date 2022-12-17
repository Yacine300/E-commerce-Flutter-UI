import 'package:flutter/material.dart';
import 'package:one/models/Product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 0,
      nom: "Run T-shirt",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [Colors.deepOrange[400], Colors.black87, Colors.blue],
      imagesProduit: [
        'assets/images/tshirt.png',
        'assets/images/shirt2.png',
        'assets/images/shirt.png',
      ],
      prix: 299.99,
      rating: 5.0,
      type: "Fitness",
      isLicked: false,
    ),
    Product(
      id: 1,
      nom: "Nike RT-28",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [
        Colors.deepOrange[400],
      ],
      imagesProduit: [
        'assets/images/Nike2.png',
      ],
      prix: 299.99,
      rating: 5.0,
      type: "Fitness",
      isLicked: false,
    ),
    Product(
      id: 2,
      nom: "Nike shoes",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [Colors.black87],
      imagesProduit: [
        'assets/images/Nike3.png',
      ],
      prix: 299.99,
      rating: 5.0,
      type: "Fitness",
      isLicked: false,
    ),
    Product(
      id: 3,
      nom: "Ps4 Controller",
      descreption:
          "ceci est une dummy descreption est etuliser pour létulite de presenter le model des  descreption a propos les different produit",
      couleurProduit: [Colors.white, Colors.purple[300]],
      imagesProduit: [
        'assets/images/ps4_console_white_1.png',
        'assets/images/ps4_console_white_2.png',
        'assets/images/ps4_console_white_3.png',
        'assets/images/ps4_console_white_4.png',
      ],
      prix: 287.99,
      rating: 5.0,
      type: "Gaming",
      isLicked: false,
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  Product findById(int produitID) {
    return items.firstWhere((element) => element.id == produitID);
  }

  void add() {
    notifyListeners();
  }

  void heratState(int produitID) {
    bool lickedState =
        items.firstWhere((element) => element.id == produitID).isLicked;
    lickedState = !lickedState;
    notifyListeners();
  }
}
