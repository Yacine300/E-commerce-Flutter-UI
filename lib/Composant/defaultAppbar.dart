import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/Constant.dart';

import 'dart:io';

class DefaultAppbar extends PreferredSize {
  final String title;

  const DefaultAppbar({this.title});
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
      ),
      centerTitle: true,
      backgroundColor: couleurPricipal,
      elevation: 0,
      leading: IconButton(
        onPressed: () => exit(0),
        icon: SvgPicture.asset("assets/icons/exit.svg"),
      ),
    );
  }
}
