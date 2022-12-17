import 'package:flutter/material.dart';

import 'package:one/Composant/SizeConfig.dart';

import 'components/StartBody.dart';
import '../../Composant/defaultAppbar.dart';

class Start extends StatelessWidget {
  static String routeName = "/Start.dart";
  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: const DefaultAppbar(
        title: "",
      ),
      body: StartBody(),
    );
  }
}
