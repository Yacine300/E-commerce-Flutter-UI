import 'package:flutter/material.dart';

import 'component/CustomCartAppbar.dart';
import 'component/detailBody.dart';

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
