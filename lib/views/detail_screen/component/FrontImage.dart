import 'package:flutter/cupertino.dart';

import '../../../utils/Constant.dart';

class FrontImage extends StatelessWidget {
  final monProduit;
  final currentIndexSelector;

  const FrontImage({this.monProduit, this.currentIndexSelector});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AspectRatio(
        aspectRatio: 40 / 20,
        child: Image.network(
          "http://$SERVER_HOST:5000/" +
              monProduit.imagesProduit[currentIndexSelector],
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
