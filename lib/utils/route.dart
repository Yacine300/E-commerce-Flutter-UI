import 'package:flutter/material.dart';

import '../views/intro_screen/intro.dart';
import '../views/detail_screen/details.dart';
import '../views/home_screen/Home.dart';
import '../views/order_screen/orders_screen.dart';
import '../views/panier_screen/Panier.dart';
import '../views/register_screen/Register_screen.dart';
import '../views/signin_screen/Sign_in_screen.dart';
import '../views/start_screen/Start_Screen.dart';
import '../views/init_screen/initialisationScreen.dart';
import '../views/splash_screen/splash_screen.dart';

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
