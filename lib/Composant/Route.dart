import 'package:flutter/material.dart';
import 'package:one/Screen/Panier/Panier.dart';

import 'package:one/Screen/Start/Start_Screen.dart';
import 'package:one/Screen/Home/Home.dart';
import 'package:one/Screen/initialisation/initialisationScreen.dart';
import 'package:one/Screen/Sign_In/Sign_in_screen.dart';
import 'package:one/Screen/Detail/details.dart';
import 'package:one/Screen/splash/splash_screen.dart';
import 'package:one/intro/intro.dart';
import 'package:one/Screen/Register/Register_screen.dart';
import 'package:one/Screen/Orders/orders_screen.dart';

Map<String, WidgetBuilder> routes = {
  Start.routeName: (context) => Start(),
  SplashScreen.routeName: (context) => SplashScreen(),
  InitScreen.routeName: (context) => InitScreen(),
  Home.routeName: (context) => Home(),
  SignIn.routeName: (context) => SignIn(),
  Details.routeName: (context) => Details(),
  Intro.routeName: (context) => Intro(),
  Register.routeName: (context) => Register(),
  Panier.routeName: (context) => Panier(),
  OrdersScreen.routeName: (context) => OrdersScreen(),
};
