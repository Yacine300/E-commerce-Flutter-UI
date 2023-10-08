import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/utils/size_config.dart';

class ProductRating extends StatelessWidget {
  const ProductRating();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfiguration.defaultSize / 2.7,
      width: SizeConfiguration.defaultSize - SizeConfiguration.defaultSize / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            '5.0',
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'roboto'),
          ),
          SvgPicture.asset("assets/icons/Star Icon.svg"),
        ],
      ),
    );
  }
}
