import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/utils/constant.dart';

import 'dart:io';

class DefaultAppbar extends StatelessWidget implements PreferredSize {
  final String title;

  const DefaultAppbar({required this.title});
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
        onPressed: () => Navigator.of(context).pop(),
        icon: SvgPicture.asset("assets/icons/exit.svg"),
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
