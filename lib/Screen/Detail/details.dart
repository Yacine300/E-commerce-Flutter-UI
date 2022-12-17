import 'package:flutter/material.dart';

import 'package:one/Screen/Detail/component/detailBody.dart';

import 'component/CustomCartAppbar.dart';

class Details extends StatelessWidget {
  static String routeName = "/details.dart";

  final int produit;
  Details({this.produit});
  @override
  Widget build(BuildContext context) {
    /* final ProductDeatilArgument arguments =
        ModalRoute.of(context).settings.arguments;*/
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const CustomCartAppbar(),
      body: DetailBody(
        produitID: produit,
      ),
    );
  }
}
