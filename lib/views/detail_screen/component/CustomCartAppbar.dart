import 'package:flutter/material.dart';

import 'CustomBackButton.dart';
import 'ProductRating.dart';

class CustomCartAppbar extends StatelessWidget implements PreferredSize {
  final dynamic productRating;

  const CustomCartAppbar({this.productRating});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

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

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
