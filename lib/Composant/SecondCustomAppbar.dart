import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/Composant/SizeConfig.dart';
import 'package:one/providers/Cart.dart';
import 'package:one/providers/orders.dart';
import 'package:provider/provider.dart';

class SecondCustomAppbar extends PreferredSize {
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
  final dummyCartItems;
  final String title;

  SecondCustomAppbar({this.dummyCartItems, @required this.title});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.grey[50],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/icons/return.svg",
        ),
      ),
      titleSpacing: SizeConfiguration.defaultSize,
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
                fontSize: 16),
          ),
          dummyCartItems != null
              ? Text(
                  '${dummyCartItems.length} item',
                  style: TextStyle(color: Colors.grey[300], fontSize: 12),
                )
              : const SizedBox(
                  height: 5,
                ),
        ],
      ),
      actions: [
        dummyCartItems != null
            ? IconButton(
                onPressed: () {
                  Provider.of<Orders>(context, listen: false)
                      .addOrder(myorder: dummyCartItems);
                  Provider.of<Carts>(context, listen: false).purchaseBuy();

                  ///Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.add,
                  color: Colors.black87,
                ))
            : const SizedBox(
                width: 10,
              ),
      ],
    );
  }
}
