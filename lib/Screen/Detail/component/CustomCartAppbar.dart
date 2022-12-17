import 'package:flutter/material.dart';

import 'CustomBackButton.dart';
import 'ProductRating.dart';

class CustomCartAppbar extends PreferredSize {
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final productRating;

  const CustomCartAppbar({this.productRating});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomBackButton(),
              const ProductRating(),
            ],
          ),
        ));
  }
}
