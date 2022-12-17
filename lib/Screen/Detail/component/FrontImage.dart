import 'package:flutter/cupertino.dart';

class FrontImage extends StatelessWidget {
  final monProduit;
  final currentIndexSelector;

  const FrontImage({this.monProduit, this.currentIndexSelector});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 80 / 40,
        child: Image.asset(monProduit.imagesProduit[currentIndexSelector]),
      ),
    );
  }
}
