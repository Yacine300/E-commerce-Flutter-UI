import 'package:flutter/material.dart';

import 'package:one/Screen/Detail/component/detailBody.dart';

import 'component/CustomCartAppbar.dart';

class Details extends StatelessWidget {
  static String routeName = "/details.dart";

  final String? produit;
  Details({this.produit});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomCartAppbar(),
      body: DetailBody(
        produitID: produit!,
      ),
    );
  }
}
