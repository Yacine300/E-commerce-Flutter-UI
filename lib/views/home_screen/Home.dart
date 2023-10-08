import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/utils/constant.dart';
import 'package:one/views/components/custom_nav_bar.dart';
import 'package:one/utils/size_config.dart';
import 'package:one/utils/enum.dart';
import 'package:provider/provider.dart';

import '../../controllers/products.dart';
import '../../models/product_model.dart';
import 'components/HomeBody.dart';

class Home extends StatelessWidget {
  static String routeName = "/Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: AddDummyProduct(),
      resizeToAvoidBottomInset: true,
      body: HomeBody(),
      bottomNavigationBar: const CustomBottomNavBar(
        selectedMenu: MenuState.home,
      ),
    );
  }
}

class AddDummyProduct extends StatefulWidget {
  const AddDummyProduct({
    Key? key,
  }) : super(key: key);

  @override
  State<AddDummyProduct> createState() => _AddDummyProductState();
}

class _AddDummyProductState extends State<AddDummyProduct> {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(
      context,
      listen: false,
    );
    Product newProduct = Product(
        nom: 'Ps4 Controller',
        descreption: 'ceci est une simple descreption',
        type: 'Gaming',
        couleurProduit: ['Black', 'White'],
        imagesProduit: [
          'uploads\\1688911640189-527550955-ps4_console_white_1-removebg-preview.png',
          'uploads\\1688911640199-48018721-ps4_console_white_2.png',
          'uploads\\1688911640203-869157235-ps4_console_white_3.png'
        ],
        prix: 1450.5,
        rating: 4.8,
        id: DateTime.now().toIso8601String(),
        isLicked: false);

    return InkWell(
      onTap: () async {
        await productData.createProduct(newProduct);
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.purple),
        child: Text(
          "+",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
