import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/Constant.dart';
import 'package:one/Composant/CustomNavBar.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/Composant/enum.dart';
import 'package:one/Screen/Home/components/HomeBody.dart';

class Home extends StatelessWidget {
  static String routeName = "/Home.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: HomeBody(),
        bottomNavigationBar: const CustomBottomNavBar(
          selectedMenu: MenuState.home,
        ));
  }
}
