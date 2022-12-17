import 'package:flutter/material.dart';

import 'package:one/providers/Cart.dart';
import 'package:one/Composant/Route.dart';
import 'package:one/Screen/Start/Start_Screen.dart';
import 'package:one/providers/orders.dart';
import 'package:one/providers/products.dart';

import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider(
            create: (context) => Orders(),
          ),
          ChangeNotifierProvider(
            create: (context) => Carts(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Cornucopia',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            fontFamily: 'Manjari',
          ),
          initialRoute: Start.routeName,
          routes: routes,
        ));
  }
}
