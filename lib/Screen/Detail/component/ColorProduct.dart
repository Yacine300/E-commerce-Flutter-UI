import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one/Composant/server_host.dart';
import 'package:one/functions/function.dart';
import 'package:one/models/Product.dart';
//import 'package:string_to_color/string_to_color.dart';

class ColorProduct extends StatefulWidget {
  final Product monProduit;
  ColorProduct({required this.monProduit});

  @override
  State<ColorProduct> createState() => _ColorProductState();
}

class _ColorProductState extends State<ColorProduct> {
  late bool lock;
  late List<Color> colors;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lock = true;
    colors = [];
  }

  @override
  Widget build(BuildContext context) {
    return lock
        ? FutureBuilder<List<Color>>(
            future: generateColors(),
            builder: (context, snapshot) {
              lock = false;
              print(lock);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator(); // Show a loading indicator while fetching the colors
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                final colors = snapshot.data;
                return Row(
                  children: List.generate(
                    widget.monProduit.imagesProduit.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(left: 7, right: 7),
                      child: CircleAvatar(
                        backgroundColor: colors![index],
                      ),
                    ),
                  ),
                );
              } else {
                return SizedBox(); // Return an empty widget if no data is available
              }
            },
          )
        : Row(
            children: List.generate(
              widget.monProduit.imagesProduit.length,
              (index) => Padding(
                padding: EdgeInsets.only(left: 7, right: 7),
                child: CircleAvatar(
                  backgroundColor: colors[index],
                ),
              ),
            ),
          );
  }

  Future<List<Color>> generateColors() async {
    for (String imagesURL in widget.monProduit.imagesProduit) {
      imagesURL.replaceAll('"', '');
      print(URI + imagesURL);
      Color color = await allColorProcess(URI + imagesURL);

      colors.add(color);
    }
    return colors;
  }
}
