import 'package:flutter/material.dart';

import 'package:one/controllers/carts.dart';
import 'package:one/utils/route.dart';
import 'package:one/controllers/orders.dart';
import 'package:one/controllers/products.dart';
import 'package:one/views/start_screen/Start_Screen.dart';

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
            useMaterial3: true,
            primarySwatch: Colors.blue,
            fontFamily: 'Manjari',
          ),
          initialRoute: Start.routeName,
          routes: routes,
        ));
  }
}
