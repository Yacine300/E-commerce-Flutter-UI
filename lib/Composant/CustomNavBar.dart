import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Screen/Home/Home.dart';
import 'package:one/Screen/Orders/orders_screen.dart';
import 'package:one/Screen/Panier/Panier.dart';

import 'enum.dart';

class CustomBottomNavBar extends StatelessWidget {
  final MenuState selectedMenu;

  const CustomBottomNavBar({required this.selectedMenu});

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: MenuState.home == selectedMenu
                        ? Colors.deepOrangeAccent
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Home.routeName);
                    if (MenuState.home == selectedMenu) {}
                  }),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/loop.svg",
                  color: MenuState.search == selectedMenu
                      ? Colors.deepOrangeAccent
                      : inActiveIconColor,
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/dashbord.svg",
                    color: MenuState.order == selectedMenu
                        ? Colors.deepOrangeAccent
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, OrdersScreen.routeName);
                    if (MenuState.order == selectedMenu) {}
                  }),
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/cart.svg",
                    color: MenuState.cart == selectedMenu
                        ? Colors.deepOrangeAccent
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Panier.routeName);
                    if (MenuState.cart == selectedMenu) {}
                  }),
            ],
          )),
    );
  }
}
