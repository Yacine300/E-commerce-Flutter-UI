import 'package:flutter/cupertino.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Screen/Panier/Panier.dart';

import 'IconBtnWithCounter.dart';
import 'SearchField.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          Spacer(),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfitem: 0,
            press: () => Navigator.pushNamed(context, Panier.routeName),
          ),
          SizedBox(
            width: 10,
          ),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
