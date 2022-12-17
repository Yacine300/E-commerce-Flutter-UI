import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one/Screen/Register/components/RegisterBody.dart';
import 'package:one/Composant/defaultAppbar.dart';

class Register extends StatelessWidget {
  static String routeName = "/Register.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppbar(
        title: "Register",
      ),
      body: RegisterBody(),
    );
  }
}
