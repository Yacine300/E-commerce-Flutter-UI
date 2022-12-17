import 'package:flutter/material.dart';

import 'package:one/Composant/defaultAppbar.dart';

import 'components/SignInBody.dart';

class SignIn extends StatelessWidget {
  static String routeName = "/Sign_in.dart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const DefaultAppbar(
        title: "Sign in",
      ),
      body: SignInBody(),
    );
  }
}
